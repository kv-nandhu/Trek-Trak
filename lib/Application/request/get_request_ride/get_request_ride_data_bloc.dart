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
      print("check 1");
      if (requestList.isEmpty) {
      print("check 2");
        emit(GetRequestRideError(error: 'No request👎'));
      print("check 3");
      } else {
      print("check 4");
        emit(GetRequestRideSuccess(requestList: requestList));
      print("check 5");
      }
    } catch (e) {
      print("check 6");
      emit(GetRequestRideError(error: e.toString()));
    }
  }
}
