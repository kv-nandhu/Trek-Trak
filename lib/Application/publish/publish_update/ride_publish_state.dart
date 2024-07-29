part of 'ride_publish_bloc.dart';

abstract class RidePublishState {}

class RidePublishInitial extends RidePublishState {}

class RidePublishingLoadingState extends RidePublishState {}

class RidePublishLoadState extends RidePublishState {
  final List<RidePublish> rides;
  RidePublishLoadState({required this.rides});
}

class RidePublishingSuccessState extends RidePublishState {
  final List<RidePublish> rides;
  RidePublishingSuccessState({required this.rides});
}

class RidePublishingErrorState extends RidePublishState {
  final String error;
  RidePublishingErrorState({required this.error});
}
