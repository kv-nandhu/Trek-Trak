import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trek_trak/infrastructure/repository/publish/search_repo.dart';
part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
   SearchRepo serachRepo;
  GoogleMapBloc(this.serachRepo) : super(GoogleMapInitial()) {
    on<GoogleMapEvent>((event, emit) async {
       if(event is AuthoCompleteLoadedEvent){
          List<dynamic>? lists=await serachRepo.getSuggetion(event.serachInput);
          print('hellow');
          emit(AuthoCompleteLoaded(authocomplete: lists!));
        } 
        if(event is afterGetEvent){
            emit(AuthoCompleteLoaded(authocomplete: []));
            print("kittiii");
        }
        if(event is addMarkerEvent){
          print(event.marker);
           emit(GoogleMarkedState(markerlist: event.marker));
        }
    });
  }

}