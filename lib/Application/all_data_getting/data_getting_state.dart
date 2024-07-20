part of 'data_getting_bloc.dart';

@immutable
 class DataGettingState {}


class RidePublishLoadingState extends DataGettingState {
 
}

class RidePublishedSuccessState extends DataGettingState {
   final List<RidePublish> ride;

  RidePublishedSuccessState({required this.ride});
}

class RidePublishErrorState extends DataGettingState{
    final String error;
  RidePublishErrorState({required this.error});
}

class RidePublishedEmptyState extends DataGettingState {}