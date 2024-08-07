import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_fields.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class UserData extends StatefulWidget {
  final String email, name, password, gender, number;
  final UserModel userModel;

  UserData({
    super.key,
    required this.email,
    required this.gender,
    required this.name,
    required this.number,
    required this.password,
    required this.userModel,
  });

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  String? pickedImage;
  final formKey = GlobalKey<FormState>();
  void pickedImagess(XFile file) async {
    pickedImage = await ImageService().uploadImageToFirebase(file);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBuildBloc, ProfileBuildState>(
      builder: (context, state) {
        if (state is ProfileImageSuccess) {
          pickedImagess(state.image);
        }
        if (state is ProfileSaveToCredentialSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Handle success scenario here, e.g., navigation
          });
        }
        if (state is ProfileBuildError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    )
                  ],
                );
              },
            );
          });
        }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: FieldsAndButton(
                      pickedImage: pickedImage,
                      formKey: formKey,
                      password: widget.password,
                      email: widget.email,
                      gender: widget.gender,
                      name: widget.name,
                      number: widget.number,
                      userModel: widget.userModel,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
