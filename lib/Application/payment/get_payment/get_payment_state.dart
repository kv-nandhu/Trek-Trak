part of 'get_payment_bloc.dart';
 class GetPaymentState {}

final class GetPaymentInitial extends GetPaymentState {}



class GetPaymentLoadingState extends GetPaymentState {}

class GetPaymentLoadedState extends GetPaymentState {
  final List<Payment> paymentRequest;

  GetPaymentLoadedState(this.paymentRequest);

  @override
  List<Object?> get props => [paymentRequest];
}

class GetPaymentErrorState extends GetPaymentState {
  final String message;

  GetPaymentErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
