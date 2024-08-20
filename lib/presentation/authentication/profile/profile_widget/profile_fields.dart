import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_button.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/domain/user_model.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController streetController = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController districtController = TextEditingController();
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
    final email = emailController.text;
    final name = nameController.text;
    final phoneNumber = phoneNumberController.text;

    return email == userModel.email &&
        name == userModel.name &&
        phoneNumber == userModel.number;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // !Profile image selection
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              BlocProvider.of<ProfileBuildBloc>(context)
                  .add(ChangeImageEvent());
              BlocProvider.of<ProfileBuildBloc>(context)
                  .add(ProfileImagePickerEvent());
            },
            child: CircleAvatar(
              radius: 90,
              backgroundImage:
                  pickedImage != null ? NetworkImage(pickedImage!) : null,
              child: pickedImage == null
                  ? const Icon(Icons.add_a_photo_outlined)
                  : null,
            ),
          ),
        ),
        //! Name input field
        nameField(name: name),
        //! Date of Birth input field
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              dateController.text =
                  '${picked.year}-${picked.month}-${picked.day}';
            }
          },
          child: const dateOfBirth(),
        ),
        // !Email input field
        emailField(email: email),
        // !Phone Number input field
        NumberField(number: number),
        // !Street input field
        const streetField(),
        // !City input field
        const cityField(),
        // !District input field
        const districtField(),
        const SizedBox(height: 20),
        // !Save button
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthBloc>(context).add(
                  signwithemailandpasswordEvent(
                    password: password,
                    name: name,
                    number: number,
                    gender: gender,
                    email: email,
                    context: context,
                    city: cityController.text,
                    street: streetController.text,
                    district: districtController.text,
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
                    // address: 'address',
                    // companyAddress: 'company_address',
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
