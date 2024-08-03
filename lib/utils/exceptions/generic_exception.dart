
class NxGenericException implements Exception {
  final String message = 'Something went wrong. Please try again.';

  NxGenericException._();

  static final NxGenericException instance = NxGenericException._();
}