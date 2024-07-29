import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'accepted_rides_view_event.dart';
part 'accepted_rides_view_state.dart';

class AcceptedRidesViewBloc extends Bloc<AcceptedRidesViewEvent, AcceptedRidesViewState> {
  final UserProfileRepo userProfileRepo;

  AcceptedRidesViewBloc(this.userProfileRepo) : super(AcceptedRidesViewInitial()) {
    on<FetchAcceptedUsersEvent>(_fetchAcceptedUsers);
    on<AcceptedUsers>(_acceptedusers);
  }

  Future<void> _fetchAcceptedUsers(
      FetchAcceptedUsersEvent event, Emitter<AcceptedRidesViewState> emit) async {
    emit(RidePaymentLoadingState());
    try {
      print("check 1");
      final acceptedUsers = await userProfileRepo.getAcceptedUsersForPublishedRide(event.acceptid);
      print("check 2");
      print(event.acceptid);
      emit(RidePaymentSuccessState(acceptedUsers));
      print(acceptedUsers);
      print("check 3");
    } catch (e) {
      print("check 4");
      emit(RidePaymentErrorState(e.toString()));
    }
  }
  Future<void> _acceptedusers(
      AcceptedUsers event, Emitter<AcceptedRidesViewState> emit) async {
    emit(AcceptedUserLoadingState());
    try {
      print("check 1");
      final acceptedUsers = await userProfileRepo.userAccepteduser();
      print("check 2");
      print(acceptedUsers.length);
      emit(AcceptedUserLoadedState(acceptedUsers));
      print(acceptedUsers);
      print("check 3");
    } catch (e) {
      print("check 4");
      emit(AcceptedUserError(e.toString()));
    }
  }
}
