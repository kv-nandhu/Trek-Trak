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
  }

  FutureOr<void> _getPublish(GetRidePublishEvent event, Emitter<DataGettingState> emit) async{
    try{
      final publishList = await UserProfileRepo().getRide();
      emit(RidePublishingSuccessState(ride: publishList));

    }catch (e) {
print(e);
    }

  }
}
