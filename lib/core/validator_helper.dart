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

  static String? validateNewPassword(String? text, String currentPassword) {
    final v = text ?? '';
    if (v.isEmpty) return ' Password is required';
    if (v.length < 8) return "At least 8 characters";
    if (!RegExp(r'[A-Z]').hasMatch(v)) {
      return 'Add an uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(v)) {
      return 'Add a lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(v)) {
      return 'Add a digit';
    }
    if (v == currentPassword) {
      return 'Must differ from the current password';
    }
    return null;
  }

  static String? validateConfirmPassword(String? text, String password) {
    final v = text ?? '';
    if (v.isEmpty) return 'Confirm Password Required';
    if (v != password) return 'Passwords do not match';
    return null;
  }
}
