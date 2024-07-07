// bloc
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_repo.dart';

part 'ride_publish_event.dart';
part 'ride_publish_state.dart';

class RidePublishBloc extends Bloc<RidePublishEvent, RidePublishState> {
  final RidePublishService ridePublishService;
  final UserProfileRepo userProfileRepo;

  RidePublishBloc(this.userProfileRepo, this.ridePublishService) : super(RidePublishInitial()) {
    on<GetRidePublishingEvent>(_ridePublishGet);
    on<AddTimeEvent>(_timeUpdate);
    on<AddDateEvent>(_dateUpdate);
    on<AddPassengerCountEvent>(_passengerCountUpdate);
    on<PickLocationEvent>(_pickLocationadd);
    on<DropLocationEvent>(_dropLocationadd);
    on<PublishRideEvent>(_publishRide);
    on<AddTravelExpenceEvent>(_expenceUpdate);
  }

  Future<void> _ridePublishGet(GetRidePublishingEvent event, Emitter<RidePublishState> emit) async {
    emit(RidePublishingLoadingState());
    try {
      var rides = await userProfileRepo.getRide(); // Changed to getRides to get a list of rides
      if (rides.isNotEmpty) {
        emit(RidePublishLoadState(rides: rides)); // Changed to emit a list of rides
      } else {
        emit(RidePublishingErrorState(error: "No rides found"));
      }
    } catch (e) {
      emit(RidePublishingErrorState(error: e.toString()));
    }
  }

  Future<void> _timeUpdate(AddTimeEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideTime(event.time);
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

  Future<void> _dateUpdate(AddDateEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideDate(event.date);
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

  Future<void> _passengerCountUpdate(AddPassengerCountEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRidePassengerCount(event.passengercount);
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

  Future<void> _expenceUpdate(AddTravelExpenceEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideExpense(event.expence);
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

  Future<void> _pickLocationadd(PickLocationEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRidePickupLocation(event.pickuplocation, event.picklatitude, event.picklongitude);
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

  Future<void> _dropLocationadd(DropLocationEvent event, Emitter<RidePublishState> emit) async {
    try {
      await ridePublishService.updateRideDropItLocation(event.dropitlocation, event.droplatitude, event.droplongitude);
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

Future<void> _publishRide(PublishRideEvent event, Emitter<RidePublishState> emit) async {
  try {
    await ridePublishService.publishRide(event);
    var rides = await userProfileRepo.getRide(); // Fetch the updated list of rides
    emit(RidePublishingSuccessState(rides: rides));
  } catch (e) {
    emit(RidePublishingErrorState(error: e.toString()));
  }
}

}
