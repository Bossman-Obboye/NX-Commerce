
class NxFormatException implements Exception {
  /// The error code associated with the exception.
  final String message;

  /// Constructor that takes an error code.
  NxFormatException([this.message = "Unexpected format error occurred. Please check your inputs."]);

  /// Create a format exception from a specific error code.
  factory NxFormatException.fromMessage(String message) {
    return NxFormatException(message);
  }

  /// Get the corresponding error message based on the error code.
  factory NxFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return NxFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return NxFormatException(
            'The phone number format is invalid. Please enter a valid phone number.');
      case 'invalid-date-format':
        return NxFormatException(
            'The date format is invalid. Please use the correct format (e.g., YYYY-MM-DD).');
      case 'invalid-url-format':
        return NxFormatException(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-username-format':
        return NxFormatException(
            'The username format is invalid. Usernames should only contain letters, numbers, and underscores.');
      case 'invalid-password-format':
        return NxFormatException(
            'The password format is invalid. Passwords must meet the complexity requirements.');
      case 'invalid-json-format':
        return NxFormatException(
            'The JSON format is invalid. Please check the structure of the JSON data.');
      case 'invalid-xml-format':
        return NxFormatException(
            'The XML format is invalid. Please check the structure of the XML data.');
      case 'invalid-credit-card-format':
        return NxFormatException(
            'The credit card number format is invalid. Please enter a valid credit card number.');
      case 'invalid-cvv-format':
        return NxFormatException(
            'The CVV format is invalid. Please enter a valid CVV.');
      case 'invalid-postal-code-format':
        return NxFormatException(
            'The postal code format is invalid. Please enter a valid postal code.');
      case 'invalid-iban-format':
        return NxFormatException(
            'The IBAN format is invalid. Please enter a valid IBAN.');
      case 'invalid-ssn-format':
        return NxFormatException(
            'The Social Security Number (SSN) format is invalid. Please enter a valid SSN.');
      case 'invalid-ipv4-format':
        return NxFormatException(
            'The IPv4 address format is invalid. Please enter a valid IPv4 address.');
      case 'invalid-ipv6-format':
        return NxFormatException(
            'The IPv6 address format is invalid. Please enter a valid IPv6 address.');
      case 'invalid-hex-color-format':
        return NxFormatException(
            'The hex color code format is invalid. Please enter a valid hex color code (e.g., #FFFFFF).');
      case 'invalid-time-format':
        return NxFormatException(
            'The time format is invalid. Please use the correct format (e.g., HH:MM:SS).');
      case 'invalid-zipcode-format':
        return NxFormatException(
            'The ZIP code format is invalid. Please enter a valid ZIP code.');
      case 'invalid-alphanumeric-format':
        return NxFormatException(
            'The input contains invalid characters. Only alphanumeric characters are allowed.');
      case 'invalid-currency-format':
        return NxFormatException(
            'The currency format is invalid. Please enter a valid currency value.');

      // Default case
      default:
        return NxFormatException('Unexpected format error occurred. Please check your inputs.');

    }
  }
}
