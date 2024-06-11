import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';

class ProfileAdding extends StatefulWidget {
  final UserModel userModel;
  const ProfileAdding({super.key, required this.userModel});

  @override
  State<ProfileAdding> createState() => _ProfileAddingState();
}

class _ProfileAddingState extends State<ProfileAdding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/mybottom');
                },
                label: Text(
                  "Back",
                  style:
                      TextStyle(color: CustomColor.greenColor(), fontSize: 20),
                ),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColor.greenColor(),
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  BlocBuilder<ProfileBuildBloc, ProfileBuildState>(
                    builder: (context, state) {
                      if (state is ProfileImageSuccess) {
                        if (state.image != null) {
                          return CircleAvatar(
                            maxRadius: 100,
                            backgroundImage: FileImage(File(state.image!.path)),
                          );
                        }
                      }
                      return CircleAvatar(
                        maxRadius: 100,
                        backgroundImage: NetworkImage(widget.userModel.image!),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ProfileBuildBloc>()
                        .add(ProfileImagegalleryPickerEvent());
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    backgroundColor: CustomColor.greenColor(),
                  ),
                  child: Text(
                    'Take a picture',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whiteColor(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<ProfileBuildBloc>()
                      .add(ProfileImagePickerEvent());
                  Navigator.pop(context);
                },
                child: Text(
                  "Choose a picture",
                  style:
                      TextStyle(fontSize: 24, color: CustomColor.greenColor()),
                ))
          ],
        ),
      ),
    );
  }
}
