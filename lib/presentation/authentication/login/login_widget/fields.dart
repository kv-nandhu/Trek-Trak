// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/sign_textfield.dart';
import 'package:trek_trak/utils/validator.dart';

final TextEditingController _emailController = TextEditingController();
String? _selectedGender;
final TextEditingController _nameController = TextEditingController();

class Password {
  static Widget passwordFields() {
    return CustomTextFormField(
      controller: _nameController,
      labelText: 'password',
      hintText: 'Enter your password',
      keyboardType: TextInputType.name,
      validator: (value) => Validator().nameValidator(value),
    );
  }

  static Widget newPasswordFields() {
    return CustomTextFormField(
      // Custom text form field
      controller: _emailController,
      labelText: 'Confirm password',
      hintText: 'Confirm your password',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator().emailValidator(value),
    );
  }
}
