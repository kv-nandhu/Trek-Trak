part of 'get_accepted_data_bloc.dart';

abstract class GetAcceptedDataState {}

class GetAcceptedDataInitial extends GetAcceptedDataState {}

class GetAcceptedloadingState extends GetAcceptedDataState {}

class GetAcceptedloadedState extends GetAcceptedDataState {
  final List<RideAccepted> rideAccepted;
  final int unreadNotificationCount;  // Added unread notification count

  GetAcceptedloadedState({
    required this.rideAccepted,
    required this.unreadNotificationCount, // Initialize unread notification count
  });
}

class GetAcceptedRideError extends GetAcceptedDataState {
  final String error;
  GetAcceptedRideError({required this.error});
}
