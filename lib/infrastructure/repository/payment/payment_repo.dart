import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/Application/payment/payment_request/payment_request_bloc.dart';

class PaymentRequesting {
  Future<void> requestPayment(PaymentAddEvent event) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Generate a unique ID for the document
        String paymentId =
            FirebaseFirestore.instance.collection("user_request").doc().id;

        // Set the document with the generated ID
        await FirebaseFirestore.instance
            .collection("payment_request")
            .doc(paymentId)
            .set({
          'name': event.name,
          'payment_id': paymentId,
          'ride_user_id': event.rideUserId,
          'ride_user_name': event.rideUserName,
          'user_id': event.userId,
          'expence': event.expence,
        });

        print('Request added successfully');
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error adding request: $e');
    }
  }
}
