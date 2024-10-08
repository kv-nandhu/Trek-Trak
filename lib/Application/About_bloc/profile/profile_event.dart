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
class AddAddressEvent extends ProfileEvent{
     final String address, companyAddress;

  AddAddressEvent({required this.address, required this.companyAddress,});
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
class UserNameEvent extends ProfileEvent{
  String name;
  UserNameEvent({required this.name});
}
class UserDobEvent extends ProfileEvent{
  String dob;
  UserDobEvent({required this.dob});
}
class UserNumberEvent extends ProfileEvent{
  String number;
  UserNumberEvent({required this.number});
}
class UserEmailEvent extends ProfileEvent{
  String email;
  UserEmailEvent({required this.email});
}
class UserImageEvent extends ProfileEvent{

  String image;
  UserImageEvent({required this.image});
}

