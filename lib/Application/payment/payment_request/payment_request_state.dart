part of 'payment_request_bloc.dart';

 class PaymentRequestState {}

final class PaymentRequestInitial extends PaymentRequestState {}


class PaymentLoadingState extends PaymentRequestState {}

class PaymentAddingSuccessState extends PaymentRequestState {}

class PaymentErrorState extends PaymentRequestState {
  final String error;

  PaymentErrorState({required this.error});
}
