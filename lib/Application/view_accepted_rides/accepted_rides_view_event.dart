part of 'accepted_rides_view_bloc.dart';

@immutable
sealed class AcceptedRidesViewEvent {
  @override
  List<Object?> get props => [];
}

class FetchAcceptedUsersEvent extends AcceptedRidesViewEvent {
  final String acceptid;

  FetchAcceptedUsersEvent(this.acceptid);

  @override
  List<Object?> get props => [acceptid];
}
class AcceptedUsers extends AcceptedRidesViewEvent {
  AcceptedUsers();

  @override
  List<Object?> get props => [];
}
