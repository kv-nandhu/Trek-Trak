import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/mini_bio_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/preference_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/profile_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/profile_update.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/vehicle_repo.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
   ProfileBloc(UserProfileRepo userProfileRepo, ) : super(ProfileInitial()) {
    on<GetUserEvent>(_profileget);
    on<UploadImageEvent>(_uploadimage);
    on<AddBioEvent>(_bioUpdate);
    on<ChatnessEvent>(_addChat);
    on<SongEvent>(_addSong);
    on<SmokingEvent>(_addSmoke);
    on<PetEvent>(_addPet);
    on<VehicleNumberEvent>(_addVehicleNumber);
    on<VehicleModelEvent>(_addVehicleModel);
    on<VehilceBrandEvent>(_addVehicleBrand);
    on<VehicleColorEvent>(_addVehicleColor);
    on<VehilceTypeEvent>(_addVehicleType);
    on<UserNameEvent>(_updateUserNAme);
    on<UserDobEvent>(_updateUserDob);
    on<UserNumberEvent>(_updateUserNumber);
    on<UserEmailEvent>(_updateUserEmail);
  
  }

  Future<void> _profileget(
      GetUserEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
    } catch (e) {
      print("error $e");
    }
  }

  Future<void> _uploadimage(
      UploadImageEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {} catch (e) {}
  }

  FutureOr<void> _bioUpdate(AddBioEvent event, Emitter<ProfileState> emit) async{
        final FirestoreService _firestoreService;

    try {
      // Update miniBio in Firestore
      await FirestoreService().updateUserMiniBio(event.miniBio);
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
      print(event.miniBio);
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _addChat(ChatnessEvent event, Emitter<ProfileState> emit) async{
    
      try{
      await PrefferenceUpdating().updateChattiness(event.chat);
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
      print(event.chat);
    }catch (e) {
     print(e);
    }
  }
  FutureOr<void> _addSong(SongEvent event, Emitter<ProfileState> emit) async{
    
      try{
      await PrefferenceUpdating().updateSong(event.song);
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
      print(event.song);
    }catch (e) {
     print(e);
    }
  }
  FutureOr<void> _addSmoke(SmokingEvent event, Emitter<ProfileState> emit) async{
    
      try{
      await PrefferenceUpdating().updateSmoke(event.smoke);
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
      print(event.smoke);
    }catch (e) {
     print(e);
    }
  }
  FutureOr<void> _addPet(PetEvent event, Emitter<ProfileState> emit) async{
    
      try{
      await PrefferenceUpdating().updatePet(event.pet);
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
      print(event.pet);
    }catch (e) {
     print(e);
    }
  }
FutureOr<void> _addVehicleNumber(VehicleNumberEvent event, Emitter<ProfileState> emit) async {
  try{
    await VehicleService().updatevehicleNumber(event.vnumber);
    var user = await UserProfileRepo().getUser();
    emit(UserProfileLoadState(user: user!));
    print(event.vnumber);
  }catch (e) {
    print(e);
  }
}

FutureOr<void> _addVehicleModel(VehicleModelEvent event, Emitter<ProfileState> emit) async {
  try {
    await VehicleService().updateVehicleModel(event.vmodel);
    var user = await UserProfileRepo().getUser();
    print(event.vmodel);
  }catch (e) {
    print(e);
  }
}

FutureOr<void> _addVehicleBrand(VehilceBrandEvent event, Emitter<ProfileState> emit) async {
  try{
    await VehicleService().updatevehiclebrand(event.vbrand);
    var user = await UserProfileRepo().getUser();
    print(event.vbrand);
  }catch (e) {
    print(e);
  }
}
FutureOr<void> _addVehicleColor(VehicleColorEvent event, Emitter<ProfileState> emit) async {
  try{
    await VehicleService().updateVehicleColor(event.vcolor);
    var user = await UserProfileRepo().getUser();
    print(event.vcolor);
  }catch (e) {
    print(e);
  }
}
FutureOr<void> _addVehicleType(VehilceTypeEvent event, Emitter<ProfileState> emit) async {
  try{
    await VehicleService().updateVehicleType(event.vtype);
    var user = await UserProfileRepo().getUser();
    print(event.vtype);
  }catch (e) {
    print(e);
  }
}
//--------------profile update -----------------------

FutureOr<void> _updateUserNAme(UserNameEvent event, Emitter<ProfileState> emit) async {
  try{
    await ProfileUpdate().updateUserName(event.name);
    var user = await UserProfileRepo().getUser();
    print(event.name);
  }catch (e) {
    print(e);
  }
}
FutureOr<void> _updateUserDob(UserDobEvent event, Emitter<ProfileState> emit) async {
  try{
    await ProfileUpdate().updateUserDob(event.dob);
    var user = await UserProfileRepo().getUser();
    print(event.dob);
  }catch (e) {
    print(e);
  }
}
FutureOr<void> _updateUserNumber(UserNumberEvent event, Emitter<ProfileState> emit) async {
  try{
    await ProfileUpdate().updateUserNumber(event.number);
    var user = await UserProfileRepo().getUser();
    print(event.number);
  }catch (e) {
    print(e);
  }
}
FutureOr<void> _updateUserEmail(UserEmailEvent event, Emitter<ProfileState> emit) async {
  try{
    await ProfileUpdate().updateUserEmail(event.email);
    var user = await UserProfileRepo().getUser();
    print(event.email);
  }catch (e) {
    print(e);
  }
}
}




