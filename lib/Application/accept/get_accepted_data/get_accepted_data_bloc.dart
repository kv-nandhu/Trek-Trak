import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'get_accepted_data_event.dart';
part 'get_accepted_data_state.dart';

class GetAcceptedDataBloc extends Bloc<GetAcceptedDataEvent, GetAcceptedDataState> {
final UserProfileRepo repository;
  GetAcceptedDataBloc(this.repository) : super(GetAcceptedDataInitial()) {
   on<GetAcceptDataEvent>(_getAccepptedRide);
  }

  Future<void> _getAccepptedRide(GetAcceptDataEvent event, Emitter<GetAcceptedDataState> emit) async {
    emit(GetAcceptedloadingState());
    try {
      final rideAccepted = await repository.getAcceptedRide();
      if (rideAccepted.isEmpty) {
        emit(GetAcceptedRideError(error: 'No requests found.'));
      } else {
        emit(GetAcceptedloadedState(rideAccepted: rideAccepted));
      }
    } catch (e) {
      emit(GetAcceptedRideError(error: e.toString()));
    }
  }  
}
