
class UValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is requried.';
    }

    // minimun password lenght
    if (value.length < 6){
      return 'Password must be at least 6 characters long.';
    }

    //upper latters
    if (!value.contains(RegExp(r'[A-Z]'))){
      return 'Password must contain at least one uppercase letter.';
    }

    //number
    if (!value.contains(RegExp(r'[0-9]'))){
      return 'Password must contain at least one number.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (9 digits requied).';
    }
    return null;
  }
}