// // event
// part of 'ride_publish_bloc.dart';

// @immutable
// abstract class RidePublishEvent {}

// class GetRidePublishEvent extends RidePublishEvent {}

// class AddTimeEvent extends RidePublishEvent {
//   final String time;
//   AddTimeEvent({required this.time});
// }

// class AddDateEvent extends RidePublishEvent {
//   final String date;
//   AddDateEvent({required this.date});
// }

// class AddPassengerCountEvent extends RidePublishEvent {
//   final String passengercount;
//   AddPassengerCountEvent({required this.passengercount});
// }
// class AddTravelExpenceEvent extends RidePublishEvent {
//   final String expence;
//   AddTravelExpenceEvent({required this.expence, });
// }

// class PickLocationEvent extends RidePublishEvent {
//   final String pickuplocation, picklatitude, picklongitude;
//   PickLocationEvent({required this.pickuplocation, required this.picklatitude, required this.picklongitude});
// }

// class DropLocationEvent extends RidePublishEvent {
//   final String dropitlocation, droplatitude, droplongitude;
//   DropLocationEvent({required this.dropitlocation, required this.droplatitude, required this.droplongitude});
// }

// class PublishRideEvent extends RidePublishEvent {
//   final String name;
//   final String pickuplocation;
//   final String dropitlocation;
//   final String middlecity;
//   final String time;
//   final String date;
//   final String passengercount;
//   final String droplatitude;
//   final String droplongitude;
//   final String picklatitude;
//   final String picklongitude;
//   final String expence;

//   PublishRideEvent({
//     required this.name,
//     required this.pickuplocation,
//     required this.dropitlocation,
//     required this.middlecity,
//     required this.time,
//     required this.date,
//     required this.passengercount,
//     required this.droplatitude,
//     required this.droplongitude,
//     required this.picklatitude,
//     required this.picklongitude,
//     required this.expence,
//   });
// }
