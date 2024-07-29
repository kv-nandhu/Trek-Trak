import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/payment_model.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';

part 'get_payment_event.dart';
part 'get_payment_state.dart';

class GetPaymentBloc extends Bloc<GetPaymentEvent, GetPaymentState> {

    final UserProfileRepo userProfileRepo;
  GetPaymentBloc(this.userProfileRepo) : super(GetPaymentInitial()) {
     on<GetPayment>(_getPayment);
  }
    Future<void> _getPayment(
      GetPayment event, Emitter<GetPaymentState> emit) async {
    emit(GetPaymentLoadingState());
    try {
      print("check 1");
      final paymentRequest = await userProfileRepo.paymentRequestGet();
      print("check 2");
      print(paymentRequest.length);
      emit(GetPaymentLoadedState(paymentRequest));
      print(paymentRequest);
      print("check 3");
    } catch (e) {
      print("check 4");
      emit(GetPaymentErrorState(e.toString()));
    }
  }
}
