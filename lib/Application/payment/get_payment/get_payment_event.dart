part of 'get_payment_bloc.dart';

@immutable
sealed class GetPaymentEvent {}


class GetPayment extends GetPaymentEvent {
  GetPayment();

  @override
  List<Object?> get props => [];
}
