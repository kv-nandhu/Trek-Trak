// Application/get_request_ride/get_request_ride_data_event.dart
part of 'get_request_ride_data_bloc.dart';

abstract class GetRequestRideDataEvent {}

class FetchRequestRideDataEvent extends GetRequestRideDataEvent {
  final String uid;
  FetchRequestRideDataEvent({required this.uid});
}
