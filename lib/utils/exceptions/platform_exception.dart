

import 'package:nx_commerce/utils/exceptions/generic_exception.dart';

class NxPlatformException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  NxPlatformException({required this.code});

  /// Get the corresponding error message based on the error code.
  String get message {
    // Custom platform error messages based on the error code
    switch (code) {
      case 'not-implemented':
        return 'This feature is not implemented on the current platform.';
      case 'unsupported-platform':
        return 'This platform is not supported.';
      case 'permission-denied':
        return 'Permission was denied for this operation.';
      case 'platform-not-available':
        return 'The requested platform feature is not available.';
      case 'method-channel-failed':
        return 'The platform-specific method call failed.';
      case 'missing-plugin':
        return 'A required plugin is missing or not installed.';
      case 'unavailable':
        return 'The service is currently unavailable on this platform.';
      case 'hardware-not-supported':
        return 'This hardware feature is not supported on your device.';
      case 'incompatible-sdk-version':
        return 'The current SDK version is not compatible with this platform.';
      case 'operation-not-supported':
        return 'This operation is not supported on the current platform.';
      case 'platform-initialization-failed':
        return 'The platform failed to initialize.';
      case 'platform-error':
        return 'An error occurred on the platform.';
      case 'unsupported-architecture':
        return 'This architecture is not supported by the platform.';
      case 'no-internet-connection':
        return 'No internet connection available.';
      case 'platform-timeout':
        return 'The operation timed out on the platform.';
      case 'platform-resource-exhausted':
        return 'The platform resource was exhausted.';
      case 'platform-service-error':
        return 'The platform service encountered an error.';
      case 'unsupported-feature':
        return 'This feature is not supported on the current platform.';
      case 'platform-api-unavailable':
        return 'The platform API is unavailable.';
      case 'platform-deprecated':
        return 'This platform is deprecated and no longer supported.';

    // Default case
      default:
        return 'An unexpected error occurred regarding the platform. Please try again.';
    }
  }
}
