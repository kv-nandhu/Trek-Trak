part of 'data_getting_bloc.dart';

@immutable
sealed class DataGettingEvent {}

class GetRidePublishEvent extends DataGettingEvent {

  GetRidePublishEvent();
}

class InduvitualPublishEvent extends DataGettingEvent{
  InduvitualPublishEvent();
}

class SearchRidesEvent extends DataGettingEvent {
  final String fromLocation;
  final String toLocation;
  final String date;

  SearchRidesEvent({required this.fromLocation, required this.toLocation, required this.date});
}