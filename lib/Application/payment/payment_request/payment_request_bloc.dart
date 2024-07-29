import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/infrastructure/repository/payment/payment_repo.dart';

part 'payment_request_event.dart';
part 'payment_request_state.dart';

class PaymentRequestBloc extends Bloc<PaymentRequestEvent, PaymentRequestState> {
final PaymentRequesting paymentRequesting;
  PaymentRequestBloc(this.paymentRequesting) : super(PaymentRequestInitial()) {
      on<PaymentAddEvent>(_paymentAdding);
    
  }

    void _paymentAdding(PaymentAddEvent event, Emitter<PaymentRequestState> emit) async {
    emit(PaymentLoadingState());
    print("1");
    try {
      await paymentRequesting.requestPayment(event);
      print("1");
      emit(PaymentAddingSuccessState());
      print("1");
    } catch (e) {
      emit(PaymentErrorState(error: e.toString()));
    }
  }
}





// class UserRequestBloc extends Bloc<UserRequestEvent, UserRequestState> {
//   final RideRequestingService rideRequestingService;

//   UserRequestBloc(this.rideRequestingService) : super(UserRequestInitial()) {
//     on<RequestAddEvent>(_requestRide);
//   }

//   void _requestRide(RequestAddEvent event, Emitter<UserRequestState> emit) async {
//     emit(RequestLoadingState());
//     try {
//       await rideRequestingService.requestRide(event);
//       emit(RequestAddingSuccessState());
//     } catch (e) {
//       emit(RequestErrorState(error: e.toString()));
//     }
//   }
// }