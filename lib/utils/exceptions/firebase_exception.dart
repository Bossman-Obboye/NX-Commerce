
class NxFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes on error code.
  NxFirebaseException(this.code);

  /// Get the corresponding error message base on the error code.
  String get message {
    switch (code) {
      default: return '';
    }
  }

}