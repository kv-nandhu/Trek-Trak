part of 'get_request_ride_data_bloc.dart';

abstract class GetRequestRideDataState {}

class GetRequestRideDataInitial extends GetRequestRideDataState {}

class GetRequestRideDataLoading extends GetRequestRideDataState {}

class GetRequestRideSuccess extends GetRequestRideDataState {
  final List<UserRequest> requestList;
  GetRequestRideSuccess({required this.requestList});
}

class GetRequestRideError extends GetRequestRideDataState {
  final String error;
  GetRequestRideError({required this.error});
}
