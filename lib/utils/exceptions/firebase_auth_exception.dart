

class NxFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes on error code.
  NxFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'The operation is sensitive and requires recent authentication. Please login again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'permission-denied':
        return 'Permission to create the account has been denied! Try again.';
      case 'email-already-exists':
        return 'The email address already exists. Please enter a different email.';
      case 'unavailable':
        return 'Please try again later. Service is currently unavailable';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support for further assistance.';
      case 'timeout':
        return 'The operation has timed out. Please check your connection and try again.';
      case 'too-many-requests':
        return 'You have made too many requests in a short period. Please try again later.';
      case 'network-request-failed':
        return 'A network error occurred. Please check your connection and try again.';
      case 'invalid-credential':
        return 'The credential provided is invalid. Please try again with a valid credential.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials. Please use a different sign-in method.';
      case 'missing-email':
        return 'No email was provided. Please enter your email and try again.';
      case 'missing-password':
        return 'No password was provided. Please enter your password and try again.';
      case 'invalid-api-key':
        return 'The API key provided is invalid. Please check your configuration.';
      case 'invalid-user-token':
        return 'The user token is invalid or has expired. Please log in again.';
      case 'multi-factor-auth-required':
        return 'Multi-factor authentication is required. Please complete the additional steps to proceed.';
      case 'invalid-action-code':
        return 'The action code provided is invalid or has expired. Please request a new code.';
      case 'invalid-recipient-email':
        return 'The recipient email is invalid. Please check the email address and try again.';
      case 'user-token-expired':
        return 'Your session has expired. Please log in again.';
      case 'weak-password-too-common':
        return 'The password provided is too common. Please choose a more secure password.';
      case 'no-such-provider':
        return 'The provider does not exist or is not supported. Please choose a different provider.';
      case 'unverified-email':
        return 'The email address is not verified. Please verify your email before proceeding.';
      case 'account-temporarily-disabled':
        return 'This account has been temporarily disabled due to suspicious activity. Please try again later.';
      case 'blocked-by-provider':
        return 'Your account has been blocked by the provider. Please contact support for further assistance.';
      case 'session-cookie-revoked':
        return 'Your session cookie has been revoked. Please log in again.';
      
      // Default case
      default:
        return 'An unexpected error occurred while perform user authentications. Please try again.';
    }
  }
}


