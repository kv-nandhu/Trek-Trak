part of 'ride_accept_bloc.dart';

abstract class RideAcceptEvent {}

class RideAcceptAddEvent extends RideAcceptEvent {
  final String uname;
  final String pickuplocation;
  final String dropitlocation;
  final String time;
  final String date;
  final String passengercount;
  // final String droplatitude;
  // final String droplongitude;
  // final String picklatitude;
  // final String picklongitude;
  final String expence;
  final String fromuid;
  final String requestUserId;
  final String image;

  RideAcceptAddEvent({
    required this.uname,
    required this.pickuplocation,
    required this.dropitlocation,
    required this.time,
    required this.date,
    required this.passengercount,
    // required this.droplatitude,
    // required this.droplongitude,
    // required this.picklatitude,
    // required this.picklongitude,
    required this.expence,
    required this.fromuid,
    required this.requestUserId,
    required this.image,
  });
}
