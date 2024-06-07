// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trek_trak/utils/textfield.dart';
import 'package:trek_trak/utils/validator.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

final TextEditingController _emailController = TextEditingController();
String? _selectedImage;
final TextEditingController _nameController = TextEditingController();
final TextEditingController _streetController = TextEditingController();
final TextEditingController _cityController = TextEditingController();
final TextEditingController _districtController = TextEditingController();
final TextEditingController dateController = TextEditingController();

class ProfileFields {
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
        controller: _streetController,
        labelText: 'Street',
        hintText: 'Enter your Street',
        keyboardType: TextInputType.streetAddress,
        validator: (value) => Validator().streetValidator(value),
      ),
    );
  }

  static Widget cityFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: _cityController,
        labelText: 'City',
        hintText: 'Enter your City',
        keyboardType: TextInputType.text,
        validator: (value) => Validator().cityValidator(value),
      ),
    );
  }

  static Widget districtFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: _districtController,
        labelText: 'District',
        hintText: 'Enter your District',
        keyboardType: TextInputType.text,
        validator: (value) => Validator().districtValidator(value),
      ),
    );
  }

  static Widget imageFields() {
    return InkWell(
      onTap: () {

      },
      child: CircleAvatar(
          radius: 90,
          backgroundImage:
              _selectedImage != null ? FileImage(File(_selectedImage!)) : null,
          child: _selectedImage == null ? const Icon(Icons.add_a_photo_outlined) : null),
    );
  }

  static Widget dobField(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        // Handle picked date here
        print('Selected date: $picked');
        // Update the text field with the selected date
        dateController.text = '${picked.year}-${picked.month}-${picked.day}';
      }
    },
    child: AbsorbPointer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400,
          height: 55,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Add border to create square shape
          ),
          child: TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              // labelText: 'Date of Birth',
              hintText: 'Select your date of birth',
              border: InputBorder.none, // Remove border of the TextFormField
            ),
            validator: (value) {
              // Add validation logic if needed
              return null; // Return null if validation passes
            },
            readOnly: true, // Make the TextFormField read-only
            onTap: () {}, // Disable editing by tapping on the TextFormField
          ),
        ),
      ),
    ),
  );
}

}
