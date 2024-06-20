// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class GetUserEvent extends ProfileEvent {}

class UploadImageEvent extends ProfileEvent {
  final String file;
  final String uid;

  UploadImageEvent({required this.file, required this.uid});

  @override
  List<Object> get props => [file, uid];
}
class AddBioEvent extends ProfileEvent{
     final String miniBio;

  AddBioEvent({required this.miniBio});
}
class ChatnessEvent extends ProfileEvent{
  String chat;
  ChatnessEvent({required this.chat});
}

class SongEvent extends ProfileEvent{
  String song;
  SongEvent({required this.song,});
}
class SmokingEvent extends ProfileEvent{
  String smoke;
  SmokingEvent({required this.smoke});
}
class PetEvent extends ProfileEvent{
  String pet;
  PetEvent({required this.pet});
}
class VehicleNumberEvent extends ProfileEvent{
  String vnumber;
  VehicleNumberEvent({required this.vnumber});
}
class VehicleModelEvent extends ProfileEvent{
  String vmodel;
  VehicleModelEvent({required this.vmodel});
}
class VehilceBrandEvent extends ProfileEvent{
  String vbrand;
  VehilceBrandEvent({required this.vbrand});
}
class VehicleColorEvent extends ProfileEvent{
  String vcolor;
  VehicleColorEvent({required this.vcolor});
}
class VehilceTypeEvent extends ProfileEvent{
  String vtype;
  VehilceTypeEvent({required this.vtype});
}

