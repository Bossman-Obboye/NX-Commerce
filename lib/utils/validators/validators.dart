class NxValidators {

  /// Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value){

    if(value == null || value.isEmpty){
      return '$fieldName is required';
    }

    return null;
  }

  /// Method to validate [Email_Address]
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    // Regular expression pattern to validate an email address
    final RegExp emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );
   if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Email is valid
  }

  /// Method to validate [Password]
  static String? validatePassword(String? value) {
    // 1. Password must not be null or empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // 2. Password must contain a minimum of 8 characters
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // 3. Password must contain at least 1 uppercase letter, 1 special character, and 1 number
    final RegExp uppercaseRegex = RegExp(r'[A-Z]');
    final RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final RegExp numberRegex = RegExp(r'[0-9]');

    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter';
    }
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least 1 special character';
    }
    if (!numberRegex.hasMatch(value)) {
      return 'Password must contain at least 1 number';
    }
    return null; // Password is valid
  }



  /// Method to validate [PhoneNumber]
  static String? validatePhoneNumber(String? value) {
    // 1. Check if the phone number is null or empty
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // 2. Define a regular expression pattern for a 10-digit US phone number
    final RegExp phoneRegex = RegExp(r'^\d{10}$');

    // 3. Check if the phone number matches the regular expression pattern
    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number format ( 10-digit required).';
    }

    return null; // Phone number is valid
  }

}