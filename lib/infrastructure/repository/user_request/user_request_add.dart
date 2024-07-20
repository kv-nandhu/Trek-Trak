// repo/ride_requesting_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/Application/user_requeset/user_request_bloc.dart';

class RideRequestingService {
  Future<void> requestRide(RequestAddEvent event) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Generate a unique ID for the document
        String requestid = FirebaseFirestore.instance.collection("user_request").doc().id;

        // Set the document with the generated ID
        await FirebaseFirestore.instance.collection("user_request").doc(requestid).set({
          'Name': event.name,
          'image': event.image,
          'Gender': event.gender,
          'number': event.number,
          'dob': event.dob,
          'uid': event.uid,
          'u_uid': event.fromuid,
          'request_id': requestid,
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
