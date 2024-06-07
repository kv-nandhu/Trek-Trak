// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_build_bloc.dart';

@immutable
sealed class ProfileBuildEvent {
  ProfileBuildEvent();

  @override
  List<Object> get props => [];
}

class ChangeImageEvent extends ProfileBuildEvent{}

class ProfileSaveToCredential extends ProfileBuildEvent {
  String image;
  String name;
  String email;
  String city;
  String street;
  String district;
  String dob;
  ProfileSaveToCredential({
    required this.image,
    required this.name,
    required this.email,
    required this.city,
    required this.street,
    required this.district,
    required this.dob,
  });
  
}

class ProfileImagePickerEvent extends ProfileBuildEvent{}

class ImageNotNull extends ProfileBuildEvent{}
