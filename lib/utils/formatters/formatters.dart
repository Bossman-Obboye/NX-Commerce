import 'package:intl/intl.dart';

class NxFormatters {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: "\$").format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    // Assuming a 10-digit phone number format: (123) 456-7890
    if(phoneNumber.length == 10){
      return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)}';
    }else if(phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0,4)}) ${phoneNumber.substring(4,7)} ${phoneNumber.substring(7)}';
    }
    // Add more format here
    return phoneNumber;
  }

// Not fully tested
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the phone number has at least the minimum number of digits required for a country code and a phone number
    if (digitOnly.length < 3) {
      throw ArgumentError('Phone number is too short.');
    }

    // Extract the country code from the digits only
    String countryCode = '+${digitOnly.substring(0, 2)}';
    digitOnly = digitOnly.substring(2);

    // Format the remaining digits
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    // Optionally, you can format the remaining number in chunks
    // Here we format as XXX-XXX-XXXX for illustration
    while (digitOnly.isNotEmpty) {
      if (digitOnly.length > 3) {
        formattedNumber.write('${digitOnly.substring(0, 3)}-');
        digitOnly = digitOnly.substring(3);
      } else {
        formattedNumber.write(digitOnly);
        digitOnly = '';
      }
    }

    return formattedNumber.toString();
  }

}