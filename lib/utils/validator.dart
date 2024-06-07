class Validator {
  //?-----------------------------------email---------------------------
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  //?-----------------------------------name---------------------------
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

//?-----------------------------------number---------------------------
  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    if (!RegExp(r'^\+\d{1,3}\d{4,}$').hasMatch(value)) {
      return 'Please enter a valid number with country code';
    }
    return null;
  }

//?-----------------------------------gender---------------------------
  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    List<String> validGenders = ['Male', 'Female', 'Other'];
    if (!validGenders.contains(value)) {
      return 'Please select a valid gender';
    }
    return null;
  }

//?-----------------------------------password---------------------------
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return 'Password must include uppercase, lowercase, number, and special character';
    }

    return null;
  }

//?-----------------------------------confirm password---------------------------
  String? confirmPasswordValidator(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

//?-----------------------------------district---------------------------
  String? districtValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your district';
    }

    // Optional: Add a regular expression for validating district format if needed
    final RegExp districtRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!districtRegex.hasMatch(value)) {
      return 'Please enter a valid district';
    }

    return null;
  }

//?-----------------------------------city---------------------------
  String? cityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your city';
    }

    final RegExp cityRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!cityRegex.hasMatch(value)) {
      return 'Please enter a valid city';
    }

    return null;
  }

//?-----------------------------------street---------------------------
  String? streetValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your street';
    }

    final RegExp streetRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!streetRegex.hasMatch(value)) {
      return 'Please enter a valid street';
    }

    return null;
  }

  String? imageValidator(String? imagePath) {
  if (imagePath == null || imagePath.isEmpty) {
    return 'Please select an image';
  }
  final RegExp imageExtensionRegex = RegExp(r'\.(jpg|jpeg|png)$');
  if (!imageExtensionRegex.hasMatch(imagePath.toLowerCase())) {
    return 'Please select a valid image file (jpg, jpeg, png)';
  }

  return null;
}
}
