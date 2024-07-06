part of 'data_getting_bloc.dart';

@immutable
 class DataGettingState {}


class RidePublishLoadingState extends DataGettingState {
 
}

class RidePublishingSuccessState extends DataGettingState {
   final List<RidePublish> ride;

  RidePublishingSuccessState({required this.ride});
}