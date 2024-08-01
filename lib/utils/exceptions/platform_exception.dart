
import 'package:flutter/services.dart';

class NxPlatformException extends PlatformException {
  NxPlatformException({required super.code, String? message, String? super.details})
      : super(message: message ?? _platformErrorMessage(code));

  static String _platformErrorMessage(String code) {
    // Custom platform error messages based on the error code
    switch (code) {
      case 'not-implemented':
        return 'This feature is not implemented on the current platform.';
      default:
        return 'An unexpected error occurred while creating the account.';
    }
  }

  @override
  String toString() => 'NxPlatformException: $message';
}