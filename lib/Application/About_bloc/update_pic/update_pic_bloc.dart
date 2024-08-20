import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek_trak/Application/About_bloc/update_pic/update_pic_event.dart';
import 'package:trek_trak/Application/About_bloc/update_pic/update_pic_state.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/image_update.dart';

class UpdatePicBloc extends Bloc<UpdatePicEvent, UpdatePicState> {
  final ImageRepo imageunile;
  UpdatePicBloc(this.imageunile) : super(UpdatePicState()) {
    on<UploadCameraPictureEvent>(_imagecamera);
    on<UploadgalleryPictureEvent>(_imagegallery);
    on<SaveEvent>(_saveEvent);
    on<Uploadfirebaseimage>(_uploadfirebase);
  }

  FutureOr<void> _imagecamera(
      UploadCameraPictureEvent event, Emitter<UpdatePicState> emit) async {
    XFile? file = await imageunile.getImageFromGallery();
    emit(state.copyWith(file: file));
  }

  FutureOr<void> _imagegallery(
      UploadgalleryPictureEvent event, Emitter<UpdatePicState> emit) async {
    XFile? file = await imageunile.getImageFromCamera();
    emit(state.copyWith(file: file));
  }

  FutureOr<void> _saveEvent(SaveEvent event, Emitter<UpdatePicState> emit) {
    emit(state.copyWith(file: null));
  }

  FutureOr<void> _uploadfirebase(
      Uploadfirebaseimage event, Emitter<UpdatePicState> emit) async {
    emit(UpdateLoading());
    await imageunile.uploadImageToFirebase(event.file, event.uid);
    emit(state.copyWith(file: null));
  }
}
