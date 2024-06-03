// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class UserProfileLoadState extends ProfileState {
  UserModel user;
  UserProfileLoadState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class UploadpicSuccess extends ProfileState {
  final String userimage;

  UploadpicSuccess(this.userimage);
  @override
  List<Object> get props => [userimage];
}

class UploadimageFailure extends ProfileState {
  String error;
  UploadimageFailure({
    required this.error,
  });
}
