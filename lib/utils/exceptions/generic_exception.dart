
class NxGenericException implements Exception {
  final String message;
  NxGenericException([this.message = 'Something went wrong. Please try again.']);
}