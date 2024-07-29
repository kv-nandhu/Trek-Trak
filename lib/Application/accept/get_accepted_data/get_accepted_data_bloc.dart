import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'get_accepted_data_event.dart';
part 'get_accepted_data_state.dart';

class GetAcceptedDataBloc extends Bloc<GetAcceptedDataEvent, GetAcceptedDataState> {
  final UserProfileRepo repository;

  GetAcceptedDataBloc(this.repository) : super(GetAcceptedDataInitial()) {
    on<GetAcceptDataEvent>(_getAcceptedRide);
    on<MarkNotificationsAsReadEvent>(_markNotificationsAsRead);
  }

  Future<void> _getAcceptedRide(GetAcceptDataEvent event, Emitter<GetAcceptedDataState> emit) async {
    emit(GetAcceptedloadingState());
    try {
      final rideAccepted = await repository.getAcceptedRide();
      if (rideAccepted.isEmpty) {
        emit(GetAcceptedRideError(error: 'No requests found.'));
      } else {
        // Calculate unread notification count
        final unreadNotificationCount = rideAccepted.where((ride) => ride.isRead!).length;

        emit(GetAcceptedloadedState(
          rideAccepted: rideAccepted,
          unreadNotificationCount: unreadNotificationCount,
        ));
      }
    } catch (e) {
      emit(GetAcceptedRideError(error: e.toString()));
    }
  }

  Future<void> _markNotificationsAsRead(MarkNotificationsAsReadEvent event, Emitter<GetAcceptedDataState> emit) async {
    try {
    
      await repository.markNotificationAsRead(event.uid);
      

      final rideAccepted = await repository.getAcceptedRide();
      
    
      final unreadNotificationCount = rideAccepted.where((ride) => ride.isRead!).length;

      emit(GetAcceptedloadedState(
        rideAccepted: rideAccepted,
        unreadNotificationCount: unreadNotificationCount,
      ));
    } catch (e) {
      emit(GetAcceptedRideError(error: e.toString()));
    }
  }
}
