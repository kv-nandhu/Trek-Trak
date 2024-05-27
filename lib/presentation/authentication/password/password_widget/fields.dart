// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/sign_textfield.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/utils/validator.dart';

final TextEditingController  passwordController= TextEditingController();
final TextEditingController  confirmpasswordController = TextEditingController();


class Password {
  static Widget passwordFields() {
    return CustomTextFormField(
      controller: passwordController,
      labelText: 'password',
      hintText: 'Enter your password',
      keyboardType: TextInputType.name,
      validator: (value) => Validator().passwordValidator(value),
    );
  }

  static Widget newPasswordFields() {
    return CustomTextFormField(
      controller: confirmpasswordController,
      labelText: 'Confirm password',
      hintText: 'Confirm your password',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator().confirmPasswordValidator(value, passwordController.text),
    );
  }
}
