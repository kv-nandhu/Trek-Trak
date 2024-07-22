import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/infrastructure/repository/ride_accept/ride_accept.dart';

part 'ride_accept_event.dart';
part 'ride_accept_state.dart';

class RideAcceptBloc extends Bloc<RideAcceptEvent, RideAcceptState> {
  final RideAcceptService rideAcceptService;

  RideAcceptBloc(this.rideAcceptService) : super(RideAcceptInitial()) {
    on<RideAcceptAddEvent>(_rideAccept);
  }

  Future<void> _rideAccept(RideAcceptAddEvent event, Emitter<RideAcceptState> emit) async {
    emit(RideAcceptLoadingState());
    try {
      await rideAcceptService.rideAccept(event);
      emit(RideAcceptLoadedState());
    } catch (e) {
      emit(RideAcceptErrorState(error: e.toString()));
    }
  }
}
