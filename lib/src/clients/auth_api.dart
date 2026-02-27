import 'dart:async';

import 'package:core/src/src.dart';
import 'package:logging/logging.dart';

/// {@template auth_api}
/// An API implementation of the [AuthClient] interface.
///
/// This class uses an injected [HttpClient] to communicate with a backend
/// authentication service, providing methods for email+code sign-in,
/// anonymous sign-in, sign-out, and retrieving the current user status.
///
/// It manages the authentication state via the [authStateChanges] stream.
///
/// All methods adhere to the standardized exception handling defined in
/// `package:core/exceptions.dart`, propagating exceptions received
/// from the underlying [HttpClient].
/// {@endtemplate}
class AuthApi implements AuthClient {
  /// {@macro auth_api}
  ///
  /// Requires an instance of [HttpClient] configured with the base URL
  /// of the API and a token provider.
  AuthApi({required HttpClient httpClient, Logger? logger})
    : _httpClient = httpClient,
      _logger = logger ?? Logger('AuthApi') {
    // Initialize with current user status check
    _initializeAuthStatus();
  }

  final HttpClient _httpClient;

  final Logger _logger;

  // Stream controller to manage and broadcast authentication state changes.
  // Using broadcast allows multiple listeners.
  final _authStateController = StreamController<User?>.broadcast();

  // Internal flag to prevent multiple initializations
  bool _isInitialized = false;

  // Helper method to check initial auth status without exposing it publicly
  // beyond the stream.
  Future<void> _initializeAuthStatus() async {
    if (_isInitialized) return;
    _isInitialized = true;
    _logger.fine('Initializing authentication status...');
    try {
      // Attempt to get the current user on startup.
      // This might fail if the user isn't logged in (e.g., 401),
      // which is expected.
      final user = await getCurrentUser();
      _authStateController.add(user);
      _logger.fine('Authentication status initialized. User: ${user?.id}');
    } on HttpException catch (e, s) {
      // If fetching the current user fails (e.g., 401 Unauthorized),
      // it means no user is currently logged in. Emit null.
      _logger.warning(
        'Failed to get current user during initialization.',
        e,
        s,
      );
      _authStateController.add(null);
    } on Object catch (e, s) {
      // Catch any other unexpected error during initialization
      // and assume no user is logged in. Consider logging this error.
      _logger.severe('Unexpected error during auth initialization.', e, s);
      _authStateController.add(null);
    }
  }

  /// Base path for authentication endpoints (proposed).
  static const String _authBasePath = '/api/v1/auth';

  @override
  Stream<User?> get authStateChanges => _authStateController.stream;

  @override
  Future<User?> getCurrentUser() async {
    _logger.fine('Attempting to get current user...');
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_authBasePath/me',
      );
      final apiResponse = SuccessApiResponse<User>.fromJson(
        response,
        (json) => User.fromJson(json! as Map<String, dynamic>),
      );
      // Update stream only if the state differs from the last emitted value
      // (Requires tracking the last emitted value, omitted for simplicity here,
      // or rely on stream distinctness if applicable).
      // For now, always add, letting listeners handle distinctness.
      _authStateController.add(apiResponse.data);
      _logger.fine('Successfully fetched current user: ${apiResponse.data.id}');
      return apiResponse.data;
    } on HttpException catch (e, s) {
      // If it's an UnauthorizedException, it means no user is logged in.
      // Emit null and return null.
      if (e is UnauthorizedException) {
        _logger.fine('No authenticated user found (401).');
        _authStateController.add(null);
        return null;
      }
      // Otherwise, rethrow the standardized exception.
      _logger.warning('HTTP error while getting current user.', e, s);
      rethrow;
    }
  }

  @override
  Future<void> requestSignInCode(
    String email, {
    bool isDashboardLogin = false,
  }) async {
    _logger.info(
      'Requesting sign-in code for email: $email, dashboard: $isDashboardLogin',
    );
    try {
      await _httpClient.post<void>(
        '$_authBasePath/request-code',
        data: {'email': email, 'isDashboardLogin': isDashboardLogin},
      );
      // No user state change here, just request sent.
    } on HttpException catch (e, s) {
      _logger.warning('Failed to request sign-in code for $email.', e, s);
      // Rethrow standardized exceptions (e.g., InvalidInputException,
      // ServerException, NetworkException).
      rethrow;
    }
  }

  @override
  Future<AuthSuccessResponse> verifySignInCode(
    String email,
    String code, {
    bool isDashboardLogin = false,
  }) async {
    _logger.info('Verifying sign-in code for email: $email');
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_authBasePath/verify-code',
        data: {
          'email': email,
          'code': code,
          'isDashboardLogin': isDashboardLogin,
        },
      );
      final apiResponse = SuccessApiResponse<AuthSuccessResponse>.fromJson(
        response,
        (json) => AuthSuccessResponse.fromJson(json! as Map<String, dynamic>),
      );
      // Successful verification, update stream with the user from the response.
      _authStateController.add(apiResponse.data.user);
      _logger.fine(
        'Successfully verified code for ${apiResponse.data.user.id}',
      );
      return apiResponse.data;
    } on HttpException catch (e, s) {
      _logger.warning('Failed to verify sign-in code for $email.', e, s);
      // Rethrow standardized exceptions (e.g., InvalidInputException,
      // AuthenticationException, ServerException, NetworkException).
      rethrow;
    }
  }

  @override
  Future<AuthSuccessResponse> signInAnonymously() async {
    _logger.info('Attempting to sign in anonymously...');
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_authBasePath/anonymous',
        data: <String, dynamic>{},
      );
      final apiResponse = SuccessApiResponse<AuthSuccessResponse>.fromJson(
        response,
        (json) => AuthSuccessResponse.fromJson(json! as Map<String, dynamic>),
      );
      // Successful anonymous sign-in, update stream with the user.
      _authStateController.add(apiResponse.data.user);
      _logger.fine(
        'Successfully signed in anonymously. User ID: ${apiResponse.data.user.id}',
      );
      return apiResponse.data;
    } on HttpException catch (e, s) {
      _logger.warning('Failed to sign in anonymously.', e, s);
      // Rethrow standardized exceptions (e.g., ServerException,
      // NetworkException).
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    _logger.info('Attempting to sign out...');
    try {
      await _httpClient.post<void>('$_authBasePath/sign-out');
    } on HttpException catch (e, s) {
      // Log or handle sign-out specific errors if necessary,
      // but generally proceed to clear local state regardless.
      // Example: Don't prevent local sign-out if network fails here.
      _logger.warning('Error during backend sign-out notification.', e, s);
    } on Object catch (e, s) {
      // Catch potential non-HTTP errors during sign-out call
      _logger.severe(
        'Unexpected error during backend sign-out notification.',
        e,
        s,
      );
    } finally {
      // Always clear the local authentication state by emitting null.
      _authStateController.add(null);
      // Note: Actual token clearing should happen where HttpClient's
      // tokenProvider gets its token (e.g., secure storage). This client
      // doesn't manage the token itself.
      _logger.info('Sign-out process complete. Local state cleared.');
    }
  }

  @override
  Future<AuthSuccessResponse> refreshToken() async {
    _logger.info('Attempting to refresh token...');
    try {
      // The POST request to the refresh endpoint requires authentication.
      // The HttpClient will automatically include the current valid token.
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_authBasePath/refresh-token',
      );
      final apiResponse = SuccessApiResponse<AuthSuccessResponse>.fromJson(
        response,
        (json) => AuthSuccessResponse.fromJson(json! as Map<String, dynamic>),
      );
      // The user object in the response is the same, but the token is new.
      // We do NOT update the authStateController here, as the user's identity
      // has not changed. The caller (AuthRepository) is responsible for
      // saving the new token.
      _logger.fine('Successfully refreshed token.');
      return apiResponse.data;
    } on HttpException catch (e, s) {
      _logger.warning('Failed to refresh token.', e, s);
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount() async {
    _logger.info('Attempting to delete user account...');
    try {
      // The http client will throw UnauthorizedException if no token is present.
      await _httpClient.delete<void>('$_authBasePath/delete-account');
      _logger.info('Account successfully deleted on the backend.');

      // Upon successful deletion, clear the local authentication state by
      // emitting null, effectively signing the user out.
      _authStateController.add(null);
      _logger.info('Local authentication state cleared.');
    } on HttpException catch (e, s) {
      _logger.warning('Failed to delete account.', e, s);
      rethrow;
    } on Object catch (e, s) {
      _logger.severe('Unexpected error during account deletion.', e, s);
      // Wrap unexpected errors in a standard exception type to conform to
      // the client interface contract.
      throw const OperationFailedException(
        'An unexpected error occurred during account deletion.',
      );
    }
  }

  /// Closes the authentication state stream controller.
  /// Should be called when the client is no longer needed to prevent leaks.
  void dispose() {
    _logger.fine('Disposing AuthApi and closing auth stream.');
    _authStateController.close();
  }
}
