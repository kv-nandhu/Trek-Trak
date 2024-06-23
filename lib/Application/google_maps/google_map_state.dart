part of 'google_map_bloc.dart';

class GoogleMapState {
  Marker? markerlist;
  GoogleMapState({ this.markerlist});
    @override
  List<Object?> get props => [markerlist];
}

final class GoogleMapInitial extends GoogleMapState {}

class AuthoCompleteLoading extends GoogleMapState {}

class AuthoCompleteLoaded extends GoogleMapState {
  final List<dynamic> authocomplete;
  AuthoCompleteLoaded({required this.authocomplete});
  @override
  List<Object> get props => [authocomplete];
}

class AuthoCompleteError extends GoogleMapState {}

class GoogleMarkedState extends GoogleMapState {
  Marker? markerlist;
  double? latie,longe;
  GoogleMarkedState({this.markerlist,this.latie,this.longe});
  @override
  List<Object?> get props => [markerlist];
}
