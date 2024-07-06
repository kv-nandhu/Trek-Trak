part of 'data_getting_bloc.dart';

@immutable
sealed class DataGettingEvent {}

class GetRidePublishEvent extends DataGettingEvent {

  GetRidePublishEvent();
}
