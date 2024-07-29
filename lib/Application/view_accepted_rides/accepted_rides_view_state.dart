part of 'accepted_rides_view_bloc.dart';

class AcceptedRidesViewState {}

final class AcceptedRidesViewInitial extends AcceptedRidesViewState {
  @override
  List<Object?> get props => [];
}

class RidePaymentLoadingState extends AcceptedRidesViewState {}

class RidePaymentSuccessState extends AcceptedRidesViewState {
  final List<RideAccepted> acceptedUsers;

  RidePaymentSuccessState(this.acceptedUsers);

  @override
  List<Object?> get props => [acceptedUsers];
}


class AcceptedUserLoadingState extends AcceptedRidesViewState {}

class AcceptedUserLoadedState extends AcceptedRidesViewState {
  final List<RideAccepted> acceptedUsers;

  AcceptedUserLoadedState(this.acceptedUsers);

  @override
  List<Object?> get props => [acceptedUsers];
}

class RidePaymentErrorState extends AcceptedRidesViewState {
  final String message;

  RidePaymentErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
class AcceptedUserError extends AcceptedRidesViewState {
  final String message;

  AcceptedUserError(this.message);

  @override
  List<Object?> get props => [message];
}
