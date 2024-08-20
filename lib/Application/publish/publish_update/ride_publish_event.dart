// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ride_publish_bloc.dart';

abstract class RidePublishEvent {}

class GetRidePublishingEvent extends RidePublishEvent {}

class AddTimeEvent extends RidePublishEvent {
  final String fromuid; // This should be the unique identifier for the ride document
  final String time;

  AddTimeEvent({ required this.fromuid, required this.time });
}

class AddDateEvent extends RidePublishEvent {
  final String date;
  final String fromuid;
  AddDateEvent({
    required this.date,
    required this.fromuid,
  });
  
}

class AddPassengerCountEvent extends RidePublishEvent {
  final String passengercount;
  final String fromuid;
  AddPassengerCountEvent({
    required this.passengercount,
    required this.fromuid,
  });
}

class PickLocationEvent extends RidePublishEvent {
  final String pickuplocation;
  final String picklatitude;
  final String picklongitude;
  final String fromuid;
  PickLocationEvent({
    required this.pickuplocation,
    required this.picklatitude,
    required this.picklongitude,
    required this.fromuid,
  });
}

class DropLocationEvent extends RidePublishEvent {
  final String droplocation;
  final String droplatitude;
  final String droplongitude;
  final String fromuid;
  DropLocationEvent({
    required this.droplocation,
    required this.droplatitude,
    required this.droplongitude,
    required this.fromuid,
  });
}

// class PublishRideEvent extends RidePublishEvent {
//   final String fromuid;
//   final String time;
//   final String date;
//   final String passengercount;
//   final String expence;
//   final String pickuplocation;
//   final String picklatitude;
//   final String picklongitude;
//   final String dropitlocation;
//   final String droplatitude;
//   final String droplongitude;
//   final String middlecity;

//   PublishRideEvent( {
//     required this.fromuid,
//     required this.time,
//     required this.date,
//     required this.passengercount,
//     required this.expence,
//     required this.pickuplocation,
//     required this.picklatitude,
//     required this.picklongitude,
//     required this.dropitlocation,
//     required this.droplatitude,
//     required this.droplongitude, 
//    required this.middlecity, 

//   });
// }

class AddTravelExpenceEvent extends RidePublishEvent {
  final String expence;
  final String fromuid;
  AddTravelExpenceEvent({
    required this.expence,
    required this.fromuid,
  });
}
