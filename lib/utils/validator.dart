class Validator {
  //-----------------------------------email---------------------------
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    return null;
  }

  //-----------------------------------name---------------------------
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

//-----------------------------------number---------------------------
  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    if (!RegExp(r'^\+\d{1,3}\d{4,}$').hasMatch(value)) {
      return 'Please enter a valid number with country code';
    }
    return null;
  }

//-----------------------------------gender---------------------------
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
}
