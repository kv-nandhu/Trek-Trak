part of 'get_accepted_data_bloc.dart';

abstract class GetAcceptedDataEvent {}

class GetAcceptDataEvent extends GetAcceptedDataEvent {
  GetAcceptDataEvent();
}

class MarkNotificationsAsReadEvent extends GetAcceptedDataEvent {
  final String uid;

  MarkNotificationsAsReadEvent(this.uid,);
}
