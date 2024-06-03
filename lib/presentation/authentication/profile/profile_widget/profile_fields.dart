// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trek_trak/utils/textfield.dart';
import 'package:trek_trak/utils/validator.dart';


final TextEditingController _emailController = TextEditingController();
String? _selectedImage;
final TextEditingController _nameController = TextEditingController();
final TextEditingController _streetController = TextEditingController();
final TextEditingController _cityController = TextEditingController();
final TextEditingController _districtController = TextEditingController();

class ProfileFields {
  static Widget phoneFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntlPhoneField(
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          prefixIcon: Text('+'),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {},
      ),
    );
  }

  static Widget nameFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: _nameController,
        labelText: 'Name',
        hintText: 'Enter your name',
        keyboardType: TextInputType.name,
        validator: (value) => Validator().nameValidator(value),
      ),
    );
  }

  static Widget emailFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        // Custom text form field
        controller: _emailController,
        labelText: 'Email',
        hintText: 'Enter your email',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Validator().emailValidator(value),
      ),
    );
  }

  static Widget streetFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        // Custom text form field
        controller: _streetController,
        labelText: 'Street',
        hintText: 'Enter your Street',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Validator().emailValidator(value),
      ),
    );
  }

  static Widget cityFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        // Custom text form field
        controller: _cityController,
        labelText: 'City',
        hintText: 'Enter your City',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Validator().emailValidator(value),
      ),
    );
  }

  static Widget districtFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        // Custom text form field
        controller: _districtController,
        labelText: 'District',
        hintText: 'Enter your District',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Validator().emailValidator(value),
      ),
    );
  }

  static Widget imageFields() {
    return InkWell(
      // onTap: _selectedImage1,
      child: CircleAvatar(
          radius: 90,
          backgroundImage:
              _selectedImage != null ? FileImage(File(_selectedImage!)) : null,
          child: _selectedImage == null ? const Text('🙈') : null),
    );
  }

  void _selectedImage1() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {}
  }
}
