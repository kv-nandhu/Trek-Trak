import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:meta/meta.dart';
import 'package:trek_trak/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/repository/profile_repo/image_picker.dart';
import 'package:image_picker/image_picker.dart'; 

part 'profile_build_event.dart';
part 'profile_build_state.dart';

class ProfileBuildBloc extends Bloc<ProfileBuildEvent, ProfileBuildState> {
  ProfileBuildBloc() : super(ProfileBuildInitial()) {
    final user = FirebaseAuth.instance.currentUser;
    bool usercheck;

    on<ProfileImagePickerEvent>((event, emit) async {
      try {
        XFile? image = await ImageService().pickImageFromGallery();

        if (image != null) {
          emit(ProfileImageSuccess(image: image));
        } else {
          emit(ProfileBuildError(message: 'Select your Image!!!'));
        }
      } on FirebaseException catch (e) {
        emit(ProfileBuildError(message: e.message.toString()));
      }
    });

    on<ChangeImageEvent>((event, emit) async {
      emit(ProfileBuildInitial());
    });
  }
}
