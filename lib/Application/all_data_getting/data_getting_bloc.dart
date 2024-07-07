import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'data_getting_event.dart';
part 'data_getting_state.dart';

class DataGettingBloc extends Bloc<DataGettingEvent, DataGettingState> {
  DataGettingBloc() : super(DataGettingState()) {
    on<GetRidePublishEvent>(_getPublish);
    on<InduvitualPublishEvent>(_indivitualRide);
    
  }

  FutureOr<void> _getPublish(GetRidePublishEvent event, Emitter<DataGettingState> emit) async{
    emit(RidePublishLoadingState());
    try{
      final publishList = await UserProfileRepo().getRide();
      emit(RidePublishedSuccessState(ride: publishList));

    }catch (e) {
print(e);
    }

  }

   FutureOr<void> _indivitualRide(InduvitualPublishEvent event, Emitter<DataGettingState> emit) async{
     emit(RidePublishLoadingState());
    try{
      final publishIndivitualList = await UserProfileRepo().getInduvitual();
      emit(RidePublishedSuccessState(ride: publishIndivitualList));

    }catch (e) {
print(e);
    }

  }
}







