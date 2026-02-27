//
// ignore_for_file: comment_references

import 'dart:async';

import 'package:core/core.dart';

/// {@template auth_client}
/// Abstract interface for authentication operations.
///
/// Implementations of this class provide concrete mechanisms for
/// user authentication (e.g., via API, Firebase, etc.), supporting
/// email+code and anonymous flows.
///
/// All methods must adhere to the standardized exception handling
/// defined in `package:core/exceptions.dart`. Implementations are
/// responsible for catching specific underlying errors (e.g., network,
/// server errors) and mapping them to the appropriate [HttpException]
/// subtypes.
/// {@endtemplate}
abstract class AuthClient {
  /// {@macro auth_client}
  const AuthClient();

  /// Stream emitting the current authenticated [User] or `null`.
  ///
  /// Emits a new value whenever the authentication state changes
  /// (e.g., after successful sign-in/verification, sign-out, or token refresh).
  /// This is the primary way for UI layers to reactively update based on
  /// the user's authentication status.
  Stream<User?> get authStateChanges;

  /// Retrieves the currently authenticated [User], if any.
  ///
  /// Returns the [User] object if a user is currently signed in and their
  /// session/token is valid. Returns `null` otherwise.
  /// This can be useful for initial checks but `authStateChanges` should be
  /// preferred for reactive updates.
  ///
  /// Throws exceptions like [NetworkException] or [ServerException] if
  /// checking the current user status requires a network call that fails.
  Future<User?> getCurrentUser();

  /// Initiates the sign-in/sign-up process using the email+code flow.
  ///
  /// This method is context-aware.
  /// - For standard flows, it triggers the backend to send a verification code
  ///   to the user's [email].
  /// - For privileged flows (e.g., dashboard login), setting
  ///   [isDashboardLogin] to `true` signals the backend to perform stricter
  ///   validation (e.g., checking if the user exists and has required roles)
  ///   before sending a code.
  ///
  /// Throws:
  /// - [InvalidInputException] if the email format is invalid.
  /// - [UnauthorizedException] if [isDashboardLogin] is true and the user
  ///   does not exist.
  /// - [ForbiddenException] if [isDashboardLogin] is true and the user lacks
  ///   the required permissions.
  /// - [NetworkException] for network issues.
  /// - [ServerException] for backend errors.
  Future<void> requestSignInCode(String email, {bool isDashboardLogin = false});

  /// Verifies the email code provided by the user and completes sign-in/sign-up.
  ///
  /// This method is context-aware.
  /// - For standard flows, it verifies the [code] for the given [email] and
  ///   either signs in an existing user or creates a new one.
  /// - For privileged flows (e.g., dashboard login), setting
  ///   [isDashboardLogin] to `true` ensures that the verification process
  ///   is strictly for login and will not create a new account.
  ///
  /// On success, returns an [AuthSuccessResponse] containing the authenticated
  /// [User] and a new token.
  ///
  /// Throws:
  /// - [InvalidInputException] if the email or code format is invalid.
  /// - [AuthenticationException] if the code is incorrect or expired.
  /// - [NotFoundException] if [isDashboardLogin] is true and the user account
  ///   does not exist (as a safeguard).
  /// - [NetworkException] for network issues.
  /// - [ServerException] for backend errors.
  Future<AuthSuccessResponse> verifySignInCode(
    String email,
    String code, {
    bool isDashboardLogin = false,
  });

  /// Signs in the user anonymously.
  ///
  /// The implementation should request the backend to:
  /// 1. Create a new anonymous user record (e.g., with `isAnonymous: true`).
  /// 2. Generate a unique user ID for this anonymous user.
  /// 3. Issue an authentication token associated with this anonymous ID.
  /// 4. Return the newly created anonymous [User] object and token in an
  ///    [AuthSuccessResponse].
  ///
  /// This allows users to use the application and potentially save data
  /// before creating a permanent account.
  ///
  /// Returns an [AuthSuccessResponse] containing the anonymous [User] and
  /// token upon successful anonymous sign-in.
  ///
  /// Throws:
  /// - [NetworkException] for network issues during the request.
  /// - [ServerException] for backend errors during anonymous user creation.
  /// - [OperationFailedException] for other failures.
  Future<AuthSuccessResponse> signInAnonymously();

  /// Signs out the current user (whether authenticated normally or anonymously).
  ///
  /// The implementation should:
  /// 1. Clear any locally stored authentication tokens or session data.
  /// 2. Optionally, notify the backend to invalidate the session/token,
  ///    especially if using opaque tokens or if immediate server-side
  ///    revocation is desired.
  ///
  /// After successful sign-out, the [authStateChanges] stream should emit `null`.
  ///
  /// Throws:
  /// - [NetworkException] if notifying the backend fails due to network issues.
  /// - [ServerException] if the backend encounters an error during token
  ///   invalidation.
  /// - [OperationFailedException] for other failures during the sign-out
  ///   process.
  Future<void> signOut();

  /// Requests a new authentication token from the backend.
  ///
  /// This method sends the user's current valid token to a dedicated refresh
  /// endpoint. The backend verifies the token, fetches any updated user
  /// preferences (like language), and issues a new token with the updated
  /// claims.
  ///
  /// Returns an [AuthSuccessResponse] containing the user and the new token.
  ///
  /// Throws:
  /// - [UnauthorizedException] if no user is currently authenticated.
  /// - [NetworkException] for network issues.
  /// - [ServerException] for backend errors.
  Future<AuthSuccessResponse> refreshToken();

  /// Deletes the current user's account permanently.
  ///
  /// This is a destructive and irreversible action. The implementation must:
  /// 1. Send an authenticated request to the backend endpoint responsible for
  ///    user account deletion (e.g., `DELETE /api/v1/auth/delete-account`).
  /// 2. Ensure that upon successful deletion, the local state is cleared
  ///    as if a `signOut` had occurred.
  ///
  /// After successful deletion, the [authStateChanges] stream should emit `null`.
  ///
  /// Throws:
  /// - [UnauthorizedException] if no user is currently authenticated.
  /// - [NetworkException] if the request fails due to network issues.
  /// - [ServerException] if the backend fails to process the deletion.
  /// - [OperationFailedException] for any other unexpected errors during the
  ///   process.
  Future<void> deleteAccount();
}
