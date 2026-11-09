class ValidatorHelper {
  static String? validateEmail(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Email Required';
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text);
    if (!emailValid) {
      return 'Email Invalid';
    }
    return null;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Password Required';
    }

    if (text.length <= 8) {
      return 'Password Invalid';
    }

    return null;
  }

  static String? validateLoginIdentifier(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your username or email';
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }
    return null;
  }

  static String? validateFullName(String? text) {
    final name = text?.trim() ?? '';

    if (name.isEmpty) {
      return 'Full Name Required';
    }

    return null;
  }
}
