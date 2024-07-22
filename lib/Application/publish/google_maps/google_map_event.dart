part of 'google_map_bloc.dart';

 class GoogleMapEvent {
    const GoogleMapEvent();

  @override
  List<Object> get props => [];
 }
class AuthoCompleteLoadedEvent extends GoogleMapEvent{
 final String serachInput;

  AuthoCompleteLoadedEvent({ this.serachInput=''});
  
  @override
  List<Object> get props => [serachInput];
}
class afterGetEvent extends GoogleMapEvent{

}
class addMarkerEvent extends GoogleMapEvent{
   Marker marker;
  double latie,longe;
  addMarkerEvent({required this.marker,required this.latie,required this.longe});
  
  @override
  List<Object> get props => [marker];
}