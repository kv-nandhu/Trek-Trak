part of 'payment_request_bloc.dart';

class PaymentRequestEvent {}

class PaymentAddEvent extends PaymentRequestEvent {
  final String? userId;
  final String? rideUserId;
  final String? name;
  final String? rideUserName;
  final String? expence;

  PaymentAddEvent({
    required this.name,
    required this.rideUserId,
    required this.rideUserName,
    required this.userId,
    required this.expence,
  });
}
