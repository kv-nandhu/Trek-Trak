 // ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_fields.dart';
import 'package:trek_trak/utils/textfield.dart';
import 'package:trek_trak/utils/validator.dart';



  class dateOfBirth extends StatelessWidget {
  const dateOfBirth({
    super.key,
  });
@override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400,
          height: 55,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: TextFormField(
            controller: dateController,
            decoration: const InputDecoration(
              hintText: 'Select your date of birth',
              border: InputBorder.none,
            ),
            validator: (value) => null,
            readOnly: true,
          ),
        ),
      ),
    );
  }
 
}
class nameField extends StatelessWidget {
  const nameField({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: nameController..text = name,
        labelText: 'Name',
        hintText: 'Enter your name',
        keyboardType: TextInputType.name,
        validator: (value) => Validator().nameValidator(value),
        errorText: nameController.text.isEmpty ? 'Name is required' : null,
      ),
    );
  }
}

class districtField extends StatelessWidget {
  const districtField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: districtController,
        labelText: 'District',
        hintText: 'Enter your district',
        keyboardType: TextInputType.text,
        validator: (value) => Validator().districtValidator(value),
        errorText: districtController.text.isEmpty ? 'district is required' : null,
      ),
    );
  }
}

class cityField extends StatelessWidget {
  const cityField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: cityController,
        labelText: 'City',
        hintText: 'Enter your city',
        keyboardType: TextInputType.text,
        validator: (value) => Validator().cityValidator(value),
        errorText: cityController.text.isEmpty ? 'street is required' : null,
      ),
    );
  }
}

class streetField extends StatelessWidget {
  const streetField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: streetController,
        labelText: 'Street',
        hintText: 'Enter your street',
        keyboardType: TextInputType.streetAddress,
        validator: (value) => Validator().streetValidator(value),
        errorText: streetController.text.isEmpty ? 'city is required' : null,
      ),
    );
  }
}

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: phoneNumberController..text = number,
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        keyboardType: TextInputType.phone,
        errorText: phoneNumberController.text.isEmpty ? 'Number is required' : null,
      ),
    );
  }
}

class emailField extends StatelessWidget {
  const emailField({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        controller: emailController..text = email,
        labelText: 'Email',
        hintText: 'Enter your email',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Validator().emailValidator(value),
        errorText: emailController.text.isEmpty ? 'email is required' : null,
      ),
    );
  }
}


