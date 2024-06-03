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
