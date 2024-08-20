import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/About_bloc/update_pic/update_pic_event.dart';
import 'package:trek_trak/Application/About_bloc/update_pic/update_pic_state.dart';
import 'package:trek_trak/Application/About_bloc/update_pic/update_pic_bloc.dart';
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
                  style: TextStyle(color: CustomColor.greenColor(), fontSize: 20),
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
                  BlocBuilder<UpdatePicBloc, UpdatePicState>(
                    builder: (context, state) {
                      if (state.file != null) {
                        return CircleAvatar(
                          maxRadius: 100,
                          backgroundImage: FileImage(File(state.file!.path)),
                        );
                      } else {
                        return CircleAvatar(
                          maxRadius: 100,
                          backgroundImage: NetworkImage(widget.userModel.image ?? ''),
                          child: widget.userModel.image == null
                              ? const Icon(Icons.person, size: 100)
                              : null,
                        );
                      }
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
                    context.read<UpdatePicBloc>().add(UploadCameraPictureEvent());
                  },
                  style: ElevatedButton.styleFrom(
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
                context.read<UpdatePicBloc>().add(UploadgalleryPictureEvent());
              },
              child: Text(
                'Choose from gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.greenColor(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<UpdatePicBloc, UpdatePicState>(
              builder: (context, state) {
                if (state.file != null) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<UpdatePicBloc>().add(
                            Uploadfirebaseimage(
                              file: state.file!,
                              uid: widget.userModel.uid!,
                            ),
                          );
                          
                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.pushReplacementNamed(context, '/mybottom');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.greenColor(),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whiteColor(),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<UpdatePicBloc, UpdatePicState>(
              builder: (context, state) {
                if (state is UpdateLoading) {
                  return const CircularProgressIndicator();
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
