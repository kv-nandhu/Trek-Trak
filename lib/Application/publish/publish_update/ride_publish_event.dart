part of 'ride_publish_bloc.dart';

abstract class RidePublishEvent {}

class GetRidePublishingEvent extends RidePublishEvent {}

class AddTimeEvent extends RidePublishEvent {
  final String time;
  AddTimeEvent(this.time);
}

class AddDateEvent extends RidePublishEvent {
  final String date;
  AddDateEvent(this.date);
}

class AddPassengerCountEvent extends RidePublishEvent {
  final String passengercount;
  AddPassengerCountEvent(this.passengercount);
}

class PickLocationEvent extends RidePublishEvent {
  final String pickuplocation;
  final String picklatitude;
  final String picklongitude;
  PickLocationEvent({ required this.pickuplocation, required this.picklatitude, required this.picklongitude});
}

class DropLocationEvent extends RidePublishEvent {
  final String droplocation;
  final String droplatitude;
  final String droplongitude;
  DropLocationEvent(this.droplocation, this.droplatitude, this.droplongitude);
}

class PublishRideEvent extends RidePublishEvent {
  final String fromuid;
  final String time;
  final String date;
  final String passengercount;
  final String expence;
  final String pickuplocation;
  final String picklatitude;
  final String picklongitude;
  final String dropitlocation;
  final String droplatitude;
  final String droplongitude;
  final String middlecity;

  PublishRideEvent( {
    required this.fromuid,
    required this.time,
    required this.date,
    required this.passengercount,
    required this.expence,
    required this.pickuplocation,
    required this.picklatitude,
    required this.picklongitude,
    required this.dropitlocation,
    required this.droplatitude,
    required this.droplongitude, 
   required this.middlecity, 

  });
}

class AddTravelExpenceEvent extends RidePublishEvent {
  final String expence;
  AddTravelExpenceEvent(this.expence);
}
