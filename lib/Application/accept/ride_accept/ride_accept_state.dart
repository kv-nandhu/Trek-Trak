part of 'ride_accept_bloc.dart';

abstract class RideAcceptState {}

class RideAcceptInitial extends RideAcceptState {}

class RideAcceptLoadingState extends RideAcceptState {}

class RideAcceptLoadedState extends RideAcceptState {}

class RideAcceptErrorState extends RideAcceptState {
  final String error;

  RideAcceptErrorState({required this.error});
}
