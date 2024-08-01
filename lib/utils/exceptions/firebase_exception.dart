
import 'package:firebase_auth/firebase_auth.dart';

class NxFirebaseException extends FirebaseException {
  NxFirebaseException({required String code, String? message})
      : super(
            plugin: 'Firebase',
            code: code,
            message: message ?? _firebaseErrorMessage(code));

  static String _firebaseErrorMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'Permission to create the account has been denied! Try again.';
      case 'unavailable':
        return 'Please try again later. Sevice is currently unavailable';
      default:
        return 'An unexpected error occurred while creating the account';
    }
  }

  @override
  String toString() => 'NxFirebaseException: $message';
}

