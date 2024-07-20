import 'package:bloc/bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'user_indivitual_event.dart';
part 'user_indivitual_state.dart';

class UserIndivitualBloc extends Bloc<UserIndivitualEvent, UserIndivitualState> {
  UserIndivitualBloc() : super(UserIndivitualInitial()) {
      on<UserUidEvent>(_userUidInduvitual);
  
  }
   Future<void> _userUidInduvitual(
      UserUidEvent event, Emitter<UserIndivitualState> emit) async {
    emit(UsesrInduvitualLoadingState());
    try {
      var user = await UserProfileRepo().getInduvitualUser(event.uid);
      emit(UserInduvitualLoadState(user: user!));
    } catch (e) {
      print("error $e");
    }
  }
}
