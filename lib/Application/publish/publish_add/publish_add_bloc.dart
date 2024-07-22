import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_add.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_repo.dart';

part 'publish_add_event.dart';
part 'publish_add_state.dart';

class PublishAddBloc extends Bloc<PublishAddEvent, PublishAddState> {
  final RidePublishAddingService ridePublishAddingService;

  PublishAddBloc(this.ridePublishAddingService) : super(PublishAddInitial()) {
    on<AddRidePublishEvent>(_addRidePublish);
  }

  Future<void> _addRidePublish(AddRidePublishEvent event, Emitter<PublishAddState> emit) async {
    emit(PublishAddingLoadingState());
    try {
      await ridePublishAddingService.addRide(event);
      emit(PublishAddingSuccessState());
    } catch (e) {
      emit(PublishAddingErrorState(error: e.toString()));
    }
  }
}
