import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class UpdatePicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadCameraPictureEvent extends UpdatePicEvent {}

class UploadgalleryPictureEvent extends UpdatePicEvent {}

class SaveEvent extends UpdatePicEvent {}

class LoadSavedImageEvent extends UpdatePicEvent {}

class Uploadfirebaseimage extends UpdatePicEvent{
  
  XFile file;
  String uid;
  Uploadfirebaseimage({required this.file,required this.uid});
}