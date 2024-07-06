// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:trek_trak/domain/publish_model.dart';
// import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';
// import 'package:trek_trak/infrastructure/repository/publish/publish_repo.dart';

// part 'ride_publish_event.dart';
// part 'ride_publish_state.dart';

// class RidePublishBloc extends Bloc<RidePublishEvent, RidePublishState> {
//   final RidePublishService ridePublishService;
//   final UserProfileRepo userProfileRepo;

//   RidePublishBloc(this.userProfileRepo, this.ridePublishService) : super(RidePublishInitial()) {
//     on<GetRidePublishEvent>(_ridePublishGet);
//     on<AddTimeEvent>(_timeUpdate);
//     on<AddDateEvent>(_dateUpdate);
//     on<AddPassengerCountEvent>(_passengerCountUpdate);
//     on<PickLocationEvent>(_pickLocationadd);
//     on<DropLocationEvent>(_dropLocationadd);
//     on<PublishRideEvent>(_publishRide);
//     on<AddTravelExpenceEvent>(_expenceUpdate);
//   }

//   Future<void> _ridePublishGet(GetRidePublishEvent event, Emitter<RidePublishState> emit) async {
//     emit(RidePublishingLoadingState());
//     try {
//       var user = await userProfileRepo.getRide();
//       if (user != null) {
//         emit(RidePublishLoadState(ride: user));
//       } else {
//         emit(RidePublishingErrorState(error: "User not found"));
//       }
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }

//   // Future<void> _timeUpdate(AddTimeEvent event, Emitter<RidePublishState> emit) async {
//   //   try {
//   //     await ridePublishService.updateRideTime(event.time);
//   //     var user = await userProfileRepo.getRide();
//   //     if (user != null) {
//   //       emit(RidePublishLoadState(ride: user));
//   //     } else {
//   //       emit(RidePublishingErrorState(error: "User not found"));
//   //     }
//   //   } catch (e) {
//   //     emit(RidePublishingErrorState(error: e.toString()));
//   //   }
//   // }

//   Future<void> _dateUpdate(AddDateEvent event, Emitter<RidePublishState> emit) async {
//     try {
//       await ridePublishService.updateRideDate(event.date);
//       var user = await userProfileRepo.getRide();
//       if (user != null) {
//         emit(RidePublishLoadState(ride: user));
//       } else {
//         emit(RidePublishingErrorState(error: "User not found"));
//       }
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }

//   Future<void> _passengerCountUpdate(AddPassengerCountEvent event, Emitter<RidePublishState> emit) async {
//     try {
//       await ridePublishService.updateRidePassengerCount(event.passengercount);
//       var user = await userProfileRepo.getRide();
//       if (user != null) {
//         emit(RidePublishLoadState(ride: user));
//       } else {
//         emit(RidePublishingErrorState(error: "User not found"));
//       }
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }
//   Future<void> _expenceUpdate(AddTravelExpenceEvent event, Emitter<RidePublishState> emit) async {
//     try {
//       await ridePublishService.updateRideExpense(event.expence);
//       var user = await userProfileRepo.getRide();
//       if (user != null) {
//         emit(RidePublishLoadState(ride: user));
//       } else {
//         emit(RidePublishingErrorState(error: "User not found"));
//       }
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }

//   Future<void> _pickLocationadd(PickLocationEvent event, Emitter<RidePublishState> emit) async {
//     try {
//       await ridePublishService.updateRidePickupLocation(event.pickuplocation, event.picklatitude, event.picklongitude);
//       var user = await userProfileRepo.getRide();
//       if (user != null) {
//         emit(RidePublishLoadState(ride: user));
//       } else {
//         emit(RidePublishingErrorState(error: "User not found"));
//       }
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }

//   Future<void> _dropLocationadd(DropLocationEvent event, Emitter<RidePublishState> emit) async {
//     try {
//       await ridePublishService.updateRideDropItLocation(event.dropitlocation, event.droplatitude, event.droplongitude);
//       var user = await userProfileRepo.getRide();
//       if (user != null) {
//         emit(RidePublishLoadState(ride: user));
//       } else {
//         emit(RidePublishingErrorState(error: "User not found"));
//       }
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }

//   Future<void> _publishRide(PublishRideEvent event, Emitter<RidePublishState> emit) async {
//     try {
//       await ridePublishService.publishRide(event);
//       emit(RidePublishingSuccessState());
//     } catch (e) {
//       emit(RidePublishingErrorState(error: e.toString()));
//     }
//   }
// }
