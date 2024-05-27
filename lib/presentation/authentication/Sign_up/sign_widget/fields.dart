// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/sign_textfield.dart';
import 'package:trek_trak/utils/validator.dart';

final TextEditingController emailController = TextEditingController();
 String? selectedGender;
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

// !--------------------------gender-----------------------------------
class CustomGenderDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomGenderDropdown({
    Key? key,
    this.value,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      items: const [
        DropdownMenuItem<String>(
          value: 'Male',
          child: Text('Male'),
        ),
        DropdownMenuItem<String>(
          value: 'Female',
          child: Text('Female'),
        ),
        DropdownMenuItem<String>(
          value: 'Other',
          child: Text('Other'),
        ),
      ],
      decoration: const InputDecoration(
        labelText: 'Gender',
        hintText: 'Select your gender',
        border: OutlineInputBorder(),
      ),
    );
  }
}

// !--------------------------phone-----------------------------------
class Fields {
  static Widget phoneFields() {
    return IntlPhoneField(
      controller: phoneController,
      validator: (value) => Validator().numberValidator(value.toString()),
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        prefixIcon: Text('+'),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {},
    );
  }

// !--------------------------name-----------------------------------
  static Widget nameFields() {
    return CustomTextFormField(
      controller: nameController,
      labelText: 'Name',
      hintText: 'Enter your name',
      keyboardType: TextInputType.name,
      validator: (value) => Validator().nameValidator(value),
    );
  }

// !--------------------------email-----------------------------------
  static Widget emailFields() {
    return CustomTextFormField(
      // Custom text form field
      controller: emailController,
      labelText: 'Email',
      hintText: 'Enter your email',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator().emailValidator(value),
    );
  }
}
