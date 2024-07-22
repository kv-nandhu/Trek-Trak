// Application/user_request/user_request_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:trek_trak/infrastructure/repository/user_request/user_request_add.dart';

part 'user_request_event.dart';
part 'user_request_state.dart';

class UserRequestBloc extends Bloc<UserRequestEvent, UserRequestState> {
  final RideRequestingService rideRequestingService;

  UserRequestBloc(this.rideRequestingService) : super(UserRequestInitial()) {
    on<RequestAddEvent>(_requestRide);
  }

  void _requestRide(RequestAddEvent event, Emitter<UserRequestState> emit) async {
    emit(RequestLoadingState());
    try {
      await rideRequestingService.requestRide(event);
      emit(RequestAddingSuccessState());
    } catch (e) {
      emit(RequestErrorState(error: e.toString()));
    }
  }
}
