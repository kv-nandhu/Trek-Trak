import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/Application/publish_update/ride_publish_bloc.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/profile_editing/edit_profile.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/textfield.dart';
import 'package:trek_trak/utils/validator.dart';
import 'package:trek_trak/domain/user_model.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneNumberController = TextEditingController();
final TextEditingController _streetController = TextEditingController();
final TextEditingController _cityController = TextEditingController();
final TextEditingController _districtController = TextEditingController();
final TextEditingController dateController = TextEditingController();

class FieldsAndButton extends StatelessWidget {
  final String? pickedImage;
  final GlobalKey<FormState> formKey;
  final String email, name, password, gender, number;
  final UserModel userModel;

  FieldsAndButton({
    Key? key,
    required this.pickedImage,
    required this.formKey,
    required this.email,
    required this.gender,
    required this.name,
    required this.password,
    required this.number,
    required this.userModel,
  }) : super(key: key);

  bool _validateProfileDetails() {
    final email = _emailController.text;
    final name = _nameController.text;
    final phoneNumber = _phoneNumberController.text;

    return email == userModel.email &&
        name == userModel.name &&
        phoneNumber == userModel.number;
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validation Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onSubmit(BuildContext context) {
    if (_validateProfileDetails()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfile(
            userModel: userModel,
          ),
        ),
      );
    } else {
      _showErrorDialog(context, 'Profile details do not match.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile image selection
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              BlocProvider.of<ProfileBuildBloc>(context).add(ChangeImageEvent());
              BlocProvider.of<ProfileBuildBloc>(context).add(ProfileImagePickerEvent());
            },
            child: CircleAvatar(
              radius: 90,
              backgroundImage: pickedImage != null ? NetworkImage(pickedImage!) : null,
              child: pickedImage == null
                  ? const Icon(Icons.add_a_photo_outlined)
                  : null,
            ),
          ),
        ),
        // Name input field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            controller: _nameController..text = name,
            labelText: 'Name',
            hintText: 'Enter your name',
            keyboardType: TextInputType.name,
            validator: (value) => Validator().nameValidator(value),
            errorText: _nameController.text.isEmpty ? 'Name is required' : null,
          ),
        ),
        // Date of Birth input field
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
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
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Select your date of birth',
                    border: InputBorder.none,
                  ),
                  validator: (value) => null,
                  readOnly: true,
                ),
              ),
            ),
          ),
        ),
        // Email input field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            controller: _emailController..text = email,
            labelText: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator().emailValidator(value),
            errorText: _emailController.text.isEmpty ? 'email is required' : null,
          ),
        ),
        // Phone Number input field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            controller: _phoneNumberController..text = number,
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            errorText: _phoneNumberController.text.isEmpty ? 'Number is required' : null,
          ),
        ),
        // Street input field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            controller: _streetController,
            labelText: 'Street',
            hintText: 'Enter your street',
            keyboardType: TextInputType.streetAddress,
            validator: (value) => Validator().streetValidator(value),
            errorText: _streetController.text.isEmpty ? 'city is required' : null,
          ),
        ),
        // City input field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            controller: _cityController,
            labelText: 'City',
            hintText: 'Enter your city',
            keyboardType: TextInputType.text,
            validator: (value) => Validator().cityValidator(value),
            errorText: _cityController.text.isEmpty ? 'street is required' : null,
          ),
        ),
        // District input field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            controller: _districtController,
            labelText: 'District',
            hintText: 'Enter your district',
            keyboardType: TextInputType.text,
            validator: (value) => Validator().districtValidator(value),
            errorText: _districtController.text.isEmpty ? 'district is required' : null,
          ),
        ),
        const SizedBox(height: 20),
        // Save button
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                // // Dispatch events to both Blocs
                // BlocProvider.of<RidePublishBloc>(context).add(
                //   PublishRideEvent(
                //     name: name,
                //     pickuplocation: "Add pick-up location",
                //     dropitlocation: 'Add drop-it location',
                //     middlecity: 'add middle city',
                //     time: 'add time',
                //     date: 'add date',
                //     passengercount: 'adda passenger count',
                //     droplatitude: 'drop latitude',
                //     droplongitude: 'drop longitude',
                //     picklatitude: 'pick latitude',
                //     picklongitude: 'pick longitude',
                //     expence:'travel_expense',
                //   ),
                // );
                BlocProvider.of<AuthBloc>(context).add(
                  signwithemailandpasswordEvent(
                    password: password,
                    name: name,
                    number: number,
                    gender: gender,
                    email: email,
                    context: context,
                    city: _cityController.text,
                    street: _streetController.text,
                    district: _districtController.text,
                    image: pickedImage!,
                    dob: dateController.text,
                    miniBio: 'miniBios',
                    chat: 'chattiness',
                    song: 'songs',
                    smoke: 'smokes',
                    pet: 'pets',
                    vnumber: 'vehicle number',
                    vmodel: 'vehicle model',
                    vbrand: 'vehicle brand',
                    vcolor: 'vehicle color',
                    vtype: 'vehicle type',
                    pickuplocation: 'pickup',
                    dropitlocation: 'drop location',
                    middlecity: 'midle city',
                    time: 'time',
                    date: 'date',
                    passengercount: 'passenger count',
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColor.greenColor(),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whiteColor(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
