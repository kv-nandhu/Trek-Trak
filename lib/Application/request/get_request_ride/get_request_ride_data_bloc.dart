import 'package:bloc/bloc.dart';
import 'package:trek_trak/domain/request_data.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'get_request_ride_data_event.dart';
part 'get_request_ride_data_state.dart';

class GetRequestRideDataBloc extends Bloc<GetRequestRideDataEvent, GetRequestRideDataState> {
  final UserProfileRepo repository;

  GetRequestRideDataBloc(this.repository) : super(GetRequestRideDataInitial()) {
    on<FetchRequestRideDataEvent>(_onFetchRequestRideDataEvent);
  }

  Future<void> _onFetchRequestRideDataEvent(FetchRequestRideDataEvent event, Emitter<GetRequestRideDataState> emit) async {
    emit(GetRequestRideDataLoading());
    try {
      final requestList = await repository.getRequestRideUser();
      if (requestList.isEmpty) {
        emit(GetRequestRideError(error: 'No requests found.'));
      } else {
        emit(GetRequestRideSuccess(requestList: requestList));
      }
    } catch (e) {
      emit(GetRequestRideError(error: e.toString()));
    }
  }
}
