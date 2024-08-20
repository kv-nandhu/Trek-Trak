import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_repo.dart';

part 'ride_publish_event.dart';
part 'ride_publish_state.dart';

class RidePublishBloc extends Bloc<RidePublishEvent, RidePublishState> {
  final RidePublishService ridePublishService;
  final UserProfileRepo userProfileRepo;

  RidePublishBloc(this.userProfileRepo, this.ridePublishService) : super(RidePublishInitial()) {
    // on<GetRidePublishingEvent>(_ridePublishGet);
    on<AddTimeEvent>(_timeUpdate);
    on<AddDateEvent>(_dateUpdate);
    on<AddPassengerCountEvent>(_passengerCountUpdate);
    on<PickLocationEvent>(_pickLocationadd);
    on<DropLocationEvent>(_dropLocationadd);
    // on<PublishRideEvent>(_publishRide);
    on<AddTravelExpenceEvent>(_expenceUpdate);
  }

  // Future<void> _ridePublishGet(GetRidePublishingEvent event, Emitter<RidePublishState> emit) async {
  //   emit(RidePublishingLoadingState());
  //   try {
  //     var rides = await userProfileRepo.getRide();
  //     if (rides.isNotEmpty) {
  //       emit(RidePublishLoadState(rides: rides));
  //     } else {
  //       emit(RidePublishingErrorState(error: "No rides found"));
  //     }
  //   } catch (e) {
  //     emit(RidePublishingErrorState(error: e.toString()));
  //   }
  // }

Future<void> _timeUpdate(AddTimeEvent event, Emitter<RidePublishState> emit) async {
  emit(RidePublishingLoadingState());
  try {
    // Ensure you are passing the correct ride ID here
    await ridePublishService.updateRideTime(event.fromuid, event.time);
    print("checkc1");

    var user = await userProfileRepo.getInduvitual();
    print("hai:  ${user}");
    print("check 2");
    emit(RidePublishingSuccessState(rides: user));
    print(event.time);
  } catch (e) {
    emit(RidePublishingErrorState(error: e.toString()));
  }
}



  Future<void> _dateUpdate(AddDateEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideDate(event.fromuid,event.date);
        var user = await userProfileRepo.getRide();
        emit(RidePublishLoadState(rides: user)); 
         print(event.date);
      await _refreshRides(emit);
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }

  Future<void> _passengerCountUpdate(AddPassengerCountEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRidePassengerCount(event.fromuid,event.passengercount);
        var user = await userProfileRepo.getRide();
        emit(RidePublishLoadState(rides: user)); 
        print(event.passengercount);
      await _refreshRides(emit);
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }

  Future<void> _expenceUpdate(AddTravelExpenceEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideExpense(event.fromuid,event.expence);
             var user = await userProfileRepo.getRide();
        emit(RidePublishLoadState(rides: user)); 
        print(event.expence);
      await _refreshRides(emit);
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }

  Future<void> _pickLocationadd(PickLocationEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRidePickupLocation(event.fromuid,event.pickuplocation, event.picklatitude, event.picklongitude);
      var rides = await userProfileRepo.getRide();
      emit(RidePublishingSuccessState(rides: rides));
      await _refreshRides(emit);
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }

  Future<void> _dropLocationadd(DropLocationEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideDropItLocation(event.fromuid,event.droplocation, event.droplatitude, event.droplongitude);
             var user = await userProfileRepo.getRide();
        emit(RidePublishLoadState(rides: user)); 
      await _refreshRides(emit);
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }

  // Future<void> _publishRide(PublishRideEvent event, Emitter<RidePublishState> emit) async {
  //   try {
  //     await ridePublishService.publishRide(event);
  //     var rides = await userProfileRepo.getRide();
  //     emit(RidePublishingSuccessState(rides: rides));
  //   } catch (e) {
  //     emit(RidePublishingErrorState(error: e.toString()));
  //   }
  // }

  Future<void> _refreshRides(Emitter<RidePublishState> emit) async {
    try {
      var rides = await userProfileRepo.getRide();
      if (rides.isNotEmpty) {
        emit(RidePublishLoadState(rides: rides));
      } else {
        emit(RidePublishingErrorState(error: "No rides found"));
      }
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }
}
