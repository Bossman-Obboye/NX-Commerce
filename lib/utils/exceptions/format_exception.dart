
class NxFormatException extends FormatException {
  NxFormatException([super.message = 'Data format is invalid.', super.source, super.offset]);

  @override
  String toString() => 'NxFormatException: $message';
}