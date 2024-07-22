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
  final String pickuplocation;
  final String dropitlocation;
  final String time;
  final String date;
  final String passengercount;
  final String droplatitude;
  final String droplongitude;
  final String picklatitude;
  final String picklongitude;
  final String expence;
  final String fromuid;
  final String requestUserId;
 

  RequestAddEvent({
    required this.name,
    required this.number,
    required this.gender,
    required this.image,
    required this.dob,
    required this.uid,
    required this.fromuid,
    required this.pickuplocation,
    required this.dropitlocation,
    required this.time,
    required this.date,
    required this.passengercount,
    required this.droplatitude,
    required this.droplongitude,
    required this.picklatitude,
    required this.picklongitude,
    required this.expence,
    required this.requestUserId,
  });
}
