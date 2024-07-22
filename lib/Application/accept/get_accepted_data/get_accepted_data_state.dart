part of 'get_accepted_data_bloc.dart';

 class GetAcceptedDataState {}

 class GetAcceptedDataInitial extends GetAcceptedDataState {}

class GetAcceptedloadingState extends GetAcceptedDataState {}

class GetAcceptedloadedState extends GetAcceptedDataState {
  final List<RideAccepted> rideAccepted;
  GetAcceptedloadedState({required this.rideAccepted});
}

class GetAcceptedRideError extends GetAcceptedDataState {
  final String error;
  GetAcceptedRideError({required this.error});
}
