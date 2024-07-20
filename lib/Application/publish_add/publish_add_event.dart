part of 'publish_add_bloc.dart';

@immutable
abstract class PublishAddEvent {}

class AddRidePublishEvent extends PublishAddEvent {

  final String uname;
  final String pickuplocation;
  final String dropitlocation;
  final String middlecity;
  final String time;
  final String date;
  final String passengercount;
  final String droplatitude;
  final String droplongitude;
  final String picklatitude;
  final String picklongitude;
  final String expence;

  AddRidePublishEvent({
    required this.uname,
    required this.pickuplocation,
    required this.dropitlocation,
    required this.middlecity,
    required this.time,
    required this.date,
    required this.passengercount,
    required this.droplatitude,
    required this.droplongitude,
    required this.picklatitude,
    required this.picklongitude,
    required this.expence,
  });
}
