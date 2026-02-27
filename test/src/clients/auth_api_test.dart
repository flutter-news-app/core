import 'dart:async';

import 'package:core/core.dart'
    show
        AccessTier,
        AuthApi,
        AuthSuccessResponse,
        AuthenticationException,
        HttpClient,
        InvalidInputException,
        NetworkException,
        OperationFailedException,
        ResponseMetadata,
        ServerException,
        SuccessApiResponse,
        UnauthorizedException,
        User,
        UserRole;
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

// Mocks
class MockHttpClient extends Mock implements HttpClient {}

class MockLogger extends Mock implements Logger {}

// Fake User for testing
final fakeUser = User(
  id: 'user-123',
  email: 'test@test.com',
  role: UserRole.user,
  tier: AccessTier.standard,
  createdAt: DateTime.now(),
  isAnonymous: false,
);
final fakeAnonymousUser = User(
  id: 'anon-456',
  email: 'anonymous@test.com',
  role: UserRole.user,
  tier: AccessTier.guest,
  createdAt: DateTime.now(),
  isAnonymous: true,
);

final fakeAuthSuccessResponse = AuthSuccessResponse(
  user: fakeUser,
  token: 'fake-token-123',
);
final fakeAnonymousAuthSuccessResponse = AuthSuccessResponse(
  user: fakeAnonymousUser,
  token: 'fake-anon-token-456',
);

// Fake ResponseMetadata for testing
final fakeResponseMetadata = ResponseMetadata(
  requestId: 'req-123',
  timestamp: DateTime.now(),
);

// Helper to create Map<String, dynamic> from SuccessApiResponse<User>
Map<String, dynamic> successUserResponseToJson(SuccessApiResponse<User> resp) {
  return {'data': resp.data.toJson(), 'metadata': resp.metadata.toJson()};
}

// Helper to create Map<String, dynamic> from SuccessApiResponse<AuthSuccessResponse>
Map<String, dynamic> successAuthResponseToJson(
  SuccessApiResponse<AuthSuccessResponse> resp,
) {
  return {'data': resp.data.toJson(), 'metadata': resp.metadata.toJson()};
}

// Helper to wait for microtasks to complete
Future<void> pumpEventQueue() => Future<void>.delayed(Duration.zero);

void main() {
  group('AuthApi', () {
    late HttpClient mockHttpClient;
    late AuthApi authApi;
    late Logger mockLogger;
    late Stream<User?> authStream; // To capture the stream early

    // --- Test Group: Initialization ---
    group('Initialization', () {
      setUp(() {
        mockHttpClient = MockHttpClient();
        registerFallbackValue(Uri.parse('http://fallback.com'));
        mockLogger = MockLogger();
      });

      tearDown(() {
        authApi.dispose();
      });

      test(
        'emits null initially if getCurrentUser throws UnauthorizedException',
        () async {
          when(
            () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
          ).thenThrow(const UnauthorizedException('No session'));
          authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
          authStream = authApi.authStateChanges;
          await expectLater(authStream.first, completion(isNull));
        },
      );

      test(
        'emits null initially if getCurrentUser throws other HttpException',
        () async {
          when(
            () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
          ).thenThrow(const ServerException('Server init error'));
          authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
          authStream = authApi.authStateChanges;
          await expectLater(authStream.first, completion(isNull));
        },
      );

      test(
        'emits null initially if getCurrentUser throws non-HttpException',
        () async {
          when(
            () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
          ).thenThrow(Exception('Unexpected init error'));
          authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
          authStream = authApi.authStateChanges;
          await expectLater(authStream.first, completion(isNull));
        },
      );

      test('emits user initially if getCurrentUser succeeds', () async {
        when(
          () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
        ).thenAnswer(
          (_) async => successUserResponseToJson(
            SuccessApiResponse(data: fakeUser, metadata: fakeResponseMetadata),
          ),
        );
        authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
        authStream = authApi.authStateChanges;
        await expectLater(authStream.first, completion(fakeUser));
      });
    });

    // --- Test Group: Operations after Successful Initialization ---
    group('Operations (Initialized with User)', () {
      setUp(() async {
        mockHttpClient = MockHttpClient();
        mockLogger = MockLogger();
        registerFallbackValue(Uri.parse('http://fallback.com'));
        when(
          () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
        ).thenAnswer(
          (_) async => successUserResponseToJson(
            SuccessApiResponse(data: fakeUser, metadata: fakeResponseMetadata),
          ),
        );
        authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
        authStream = authApi.authStateChanges;
        await authStream.first;
        await pumpEventQueue();
        clearInteractions(mockHttpClient);
        when(
          () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
        ).thenAnswer(
          (_) async => successUserResponseToJson(
            SuccessApiResponse(data: fakeUser, metadata: fakeResponseMetadata),
          ),
        );
        when(
          () => mockHttpClient.post<void>(
            any<String>(),
            data: any<dynamic>(named: 'data'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
        ).thenAnswer((_) async {});
        when(
          () => mockHttpClient.post<Map<String, dynamic>>(
            any<String>(),
            data: any<dynamic>(named: 'data'),
          ),
        ).thenAnswer(
          (_) async => successAuthResponseToJson(
            SuccessApiResponse(
              data: fakeAuthSuccessResponse,
              metadata: fakeResponseMetadata,
            ),
          ),
        );
      });

      tearDown(() {
        authApi.dispose();
      });

      test(
        'getCurrentUser returns user without extra stream emission',
        () async {
          final user = await authApi.getCurrentUser();
          expect(user, fakeUser);
          verify(
            () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
          ).called(1);
          verify(() => mockLogger.fine(any<String>())).called(greaterThan(0));
        },
      );

      test('signOut emits null', () async {
        final expectation = expectLater(authStream, emits(isNull));
        await authApi.signOut();
        await expectation;
        verify(
          () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
        ).called(1);
        verify(() => mockLogger.info('Attempting to sign out...')).called(1);
        verify(
          () => mockLogger.info(
            'Sign-out process complete. Local state cleared.',
          ),
        ).called(1);
      });

      test(
        'signOut completes and emits null even if HTTP call fails',
        () async {
          when(
            () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
          ).thenThrow(const NetworkException());
          final expectation = expectLater(authStream, emits(isNull));
          await expectLater(authApi.signOut(), completes);
          await expectation;
          verify(
            () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
          ).called(1);
          verify(
            () => mockLogger.warning(
              any<String>(),
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        },
      );

      group('deleteAccount', () {
        test('succeeds and emits null', () async {
          // Arrange
          when(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).thenAnswer((_) async {});

          // Act & Assert
          final expectation = expectLater(authStream, emits(isNull));
          await authApi.deleteAccount();
          await expectation;

          verify(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).called(1);
          verify(
            () => mockLogger.info('Attempting to delete user account...'),
          ).called(1);
          verify(
            () =>
                mockLogger.info('Account successfully deleted on the backend.'),
          ).called(1);
          verify(
            () => mockLogger.info('Local authentication state cleared.'),
          ).called(1);
        });

        test('rethrows HttpException and does not emit state change', () async {
          const exception = ServerException('Backend failed');
          when(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).thenThrow(exception);

          // We don't expect a stream emission, so we just verify the exception
          // is thrown.
          await expectLater(
            () => authApi.deleteAccount(),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).called(1);
          verify(
            () => mockLogger.warning(
              'Failed to delete account.',
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        });

        test('throws OperationFailedException on generic error', () async {
          final exception = Exception('Generic error');
          when(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).thenThrow(exception);

          await expectLater(
            () => authApi.deleteAccount(),
            throwsA(isA<OperationFailedException>()),
          );

          verify(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).called(1);
          verify(
            () => mockLogger.severe(
              'Unexpected error during account deletion.',
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        });
      });

      group('refreshToken', () {
        test('succeeds and returns AuthSuccessResponse', () async {
          when(
            () => mockHttpClient.post<Map<String, dynamic>>(
              '/api/v1/auth/refresh-token',
            ),
          ).thenAnswer(
            (_) async => successAuthResponseToJson(
              SuccessApiResponse(
                data: fakeAuthSuccessResponse,
                metadata: fakeResponseMetadata,
              ),
            ),
          );

          final result = await authApi.refreshToken();

          expect(result, equals(fakeAuthSuccessResponse));
          verify(
            () => mockHttpClient.post<Map<String, dynamic>>(
              '/api/v1/auth/refresh-token',
            ),
          ).called(1);
          verify(
            () => mockLogger.fine('Successfully refreshed token.'),
          ).called(1);
        });

        test('rethrows HttpException on failure', () async {
          const exception = ServerException('Refresh failed');
          when(
            () => mockHttpClient.post<Map<String, dynamic>>(
              '/api/v1/auth/refresh-token',
            ),
          ).thenThrow(exception);

          await expectLater(
            () => authApi.refreshToken(),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => mockLogger.warning(
              'Failed to refresh token.',
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        });
      });
    });

    // --- Test Group: Operations after Failed Initialization (Unauthorized) ---
    group('Operations (Initialized Unauthorized)', () {
      setUp(() async {
        mockHttpClient = MockHttpClient();
        mockLogger = MockLogger();
        registerFallbackValue(Uri.parse('http://fallback.com'));
        when(
          () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
        ).thenThrow(const UnauthorizedException('No session'));
        authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
        authStream = authApi.authStateChanges;
        await authStream.first;
        await pumpEventQueue();
        clearInteractions(mockHttpClient);
        clearInteractions(mockLogger);
        when(
          () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
        ).thenThrow(const UnauthorizedException('No session'));
        when(
          () => mockHttpClient.post<void>(
            any<String>(),
            data: any<dynamic>(named: 'data'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
        ).thenAnswer((_) async {});
        when(
          () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
        ).thenThrow(const UnauthorizedException('No session'));
        when(
          () => mockHttpClient.post<Map<String, dynamic>>(
            '/api/v1/auth/verify-code',
            data: any<dynamic>(named: 'data'),
          ),
        ).thenAnswer(
          (_) async => successAuthResponseToJson(
            SuccessApiResponse(
              data: fakeAuthSuccessResponse,
              metadata: fakeResponseMetadata,
            ),
          ),
        );
        when(
          () => mockHttpClient.post<Map<String, dynamic>>(
            '/api/v1/auth/anonymous',
            data: any<dynamic>(named: 'data'),
          ),
        ).thenAnswer(
          (_) async => successAuthResponseToJson(
            SuccessApiResponse(
              data: fakeAnonymousAuthSuccessResponse,
              metadata: fakeResponseMetadata,
            ),
          ),
        );
      });

      tearDown(() {
        authApi.dispose();
      });

      test(
        'getCurrentUser returns null without extra stream emission',
        () async {
          final user = await authApi.getCurrentUser();
          expect(user, isNull);
          verify(
            () => mockHttpClient.get<Map<String, dynamic>>('/api/v1/auth/me'),
          ).called(1);
          verify(
            () => mockLogger.fine('No authenticated user found (401).'),
          ).called(1);
        },
      );

      test('requestSignInCode completes normally', () async {
        await expectLater(
          authApi.requestSignInCode('test@test.com'),
          completes,
        );
        verify(
          () => mockHttpClient.post<void>(
            '/api/v1/auth/request-code',
            data: {'email': 'test@test.com', 'isDashboardLogin': false},
          ),
        ).called(1);
        verify(
          () => mockLogger.info(
            any<String>(that: contains('Requesting sign-in code')),
          ),
        ).called(1);
      });

      test('requestSignInCode rethrows HttpExceptions', () async {
        const exception = InvalidInputException('Bad email');
        when(
          () => mockHttpClient.post<void>(
            '/api/v1/auth/request-code',
            data: any<dynamic>(named: 'data'),
          ),
        ).thenThrow(exception);
        await expectLater(
          () => authApi.requestSignInCode('bad-email'),
          throwsA(isA<InvalidInputException>()),
        );
        verify(
          () => mockHttpClient.post<void>(
            '/api/v1/auth/request-code',
            data: {'email': 'bad-email', 'isDashboardLogin': false},
          ),
        ).called(1);
        verify(
          () => mockLogger.warning(
            any<String>(that: contains('Failed to request sign-in code')),
            any<Object?>(),
            any<StackTrace?>(),
          ),
        ).called(1);
      });

      test(
        'verifySignInCode returns AuthSuccessResponse and emits user state',
        () async {
          final expectation = expectLater(authStream, emits(fakeUser));
          final result = await authApi.verifySignInCode(
            'test@test.com',
            '123456',
          );
          expect(result, equals(fakeAuthSuccessResponse));
          expect(result.user, equals(fakeUser));
          await expectation;
          verify(
            () => mockHttpClient.post<Map<String, dynamic>>(
              '/api/v1/auth/verify-code',
              data: {
                'email': 'test@test.com',
                'code': '123456',
                'isDashboardLogin': false,
              },
            ),
          ).called(1);
          verify(
            () => mockLogger.info(
              any<String>(that: contains('Verifying sign-in code')),
            ),
          ).called(1);
          verify(
            () => mockLogger.fine(
              any<String>(that: contains('Successfully verified code')),
            ),
          ).called(1);
        },
      );

      test('verifySignInCode rethrows HttpExceptions', () async {
        const exception = AuthenticationException('Invalid code');
        when(
          () => mockHttpClient.post<Map<String, dynamic>>(
            '/api/v1/auth/verify-code',
            data: any<dynamic>(named: 'data'),
          ),
        ).thenThrow(exception);
        await expectLater(
          () => authApi.verifySignInCode('test@test.com', 'wrong-code'),
          throwsA(isA<AuthenticationException>()),
        );
        verify(
          () => mockHttpClient.post<Map<String, dynamic>>(
            '/api/v1/auth/verify-code',
            data: {
              'email': 'test@test.com',
              'code': 'wrong-code',
              'isDashboardLogin': false,
            },
          ),
        ).called(1);
        verify(
          () => mockLogger.warning(
            any<String>(that: contains('Failed to verify sign-in code')),
            any<Object?>(),
            any<StackTrace?>(),
          ),
        ).called(1);
      });

      test(
        'signInAnonymously returns AuthSuccessResponse and emits user state',
        () async {
          final expectation = expectLater(authStream, emits(fakeAnonymousUser));
          final result = await authApi.signInAnonymously();
          expect(result, equals(fakeAnonymousAuthSuccessResponse));
          expect(result.user, equals(fakeAnonymousUser));
          await expectation;
          verify(
            () => mockHttpClient.post<Map<String, dynamic>>(
              '/api/v1/auth/anonymous',
              data: <String, dynamic>{},
            ),
          ).called(1);
          verify(
            () => mockLogger.info('Attempting to sign in anonymously...'),
          ).called(1);
          verify(
            () => mockLogger.fine(
              any<String>(that: contains('Successfully signed in anonymously')),
            ),
          ).called(1);
        },
      );

      test('signInAnonymously rethrows HttpExceptions', () async {
        const exception = ServerException('Failed to create anon user');
        when(
          () => mockHttpClient.post<Map<String, dynamic>>(
            '/api/v1/auth/anonymous',
            data: <String, dynamic>{},
          ),
        ).thenThrow(exception);
        await expectLater(
          () => authApi.signInAnonymously(),
          throwsA(isA<ServerException>()),
        );
        verify(
          () => mockHttpClient.post<Map<String, dynamic>>(
            '/api/v1/auth/anonymous',
            data: <String, dynamic>{},
          ),
        ).called(1);
        verify(
          () => mockLogger.warning(
            'Failed to sign in anonymously.',
            any<Object?>(),
            any<StackTrace?>(),
          ),
        ).called(1);
      });

      test('signOut completes and emits null', () async {
        final expectation = expectLater(authStream, emits(isNull));
        await authApi.signOut();
        await expectation;
        verify(
          () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
        ).called(1);
      });

      test(
        'signOut completes and emits null even if HTTP call throws generic Object',
        () async {
          when(
            () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
          ).thenThrow(Exception('Generic error'));

          final expectation = expectLater(authStream, emits(isNull));
          await expectLater(authApi.signOut(), completes);
          await expectation;

          verify(
            () => mockHttpClient.post<void>('/api/v1/auth/sign-out'),
          ).called(1);
          verify(
            () => mockLogger.severe(
              'Unexpected error during backend sign-out notification.',
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        },
      );

      group('deleteAccount', () {
        test('throws UnauthorizedException', () async {
          // The mock http client is set up to throw this, simulating no token.
          await expectLater(
            () => authApi.deleteAccount(),
            throwsA(isA<UnauthorizedException>()),
          );

          verify(
            () => mockHttpClient.delete<void>('/api/v1/auth/delete-account'),
          ).called(1);
          verify(
            () => mockLogger.warning(
              'Failed to delete account.',
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        });
      });

      group('refreshToken', () {
        test('throws UnauthorizedException when not logged in', () async {
          when(
            () => mockHttpClient.post<Map<String, dynamic>>(
              '/api/v1/auth/refresh-token',
            ),
          ).thenThrow(const UnauthorizedException('No token'));

          await expectLater(
            () => authApi.refreshToken(),
            throwsA(isA<UnauthorizedException>()),
          );

          verify(
            () => mockLogger.warning(
              'Failed to refresh token.',
              any<Object?>(),
              any<StackTrace?>(),
            ),
          ).called(1);
        });
      });
    });

    // --- Test Group: Dispose ---
    group('Dispose', () {
      test('closes the authStateChanges stream', () async {
        // Arrange
        mockHttpClient = MockHttpClient();
        mockLogger = MockLogger();
        registerFallbackValue(Uri.parse('http://fallback.com'));
        when(
          () => mockHttpClient.get<Map<String, dynamic>>(any<String>()),
        ).thenThrow(const UnauthorizedException('No session'));
        authApi = AuthApi(httpClient: mockHttpClient, logger: mockLogger);
        await pumpEventQueue(); // Allow _initializeAuthStatus to complete
        final stream = authApi.authStateChanges;

        // Act: Dispose the API instance
        authApi.dispose();
        verify(
          () => mockLogger.fine('Disposing AuthApi and closing auth stream.'),
        ).called(1);

        // Assert: Expect the stream to be closed
        await expectLater(stream, emitsDone);
      });
    });
  });
}
