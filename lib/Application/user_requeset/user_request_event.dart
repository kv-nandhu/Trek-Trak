// Application/user_request/user_request_event.dart
part of 'user_request_bloc.dart';

abstract class UserRequestEvent {}

class RequestAddEvent extends UserRequestEvent {
  final String? name;
  final String? number;
  final String? gender;
  final String? image;
  final String? dob;
  final String? uid;
  final String? fromuid;

  RequestAddEvent({
    required this.name,
    required this.number,
    required this.gender,
    required this.image,
    required this.dob,
    required this.uid,
    required this.fromuid,
  });
}
