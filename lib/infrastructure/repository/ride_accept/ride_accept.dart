import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/Application/accept/ride_accept/ride_accept_bloc.dart';
class RideAcceptService {
  Future<void> rideAccept(RideAcceptAddEvent event) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch the user's details from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          print("=======================================================+++++++++++++++++++++++++===================================================");
          print(user.uid);
        
        if (userDoc.exists) {
          print("=================================================[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]==============================================");
          // Extract user details
          String userName = userDoc['Name'];
          print('`````````````````````````````````````````````````````````````````````````````````````');
          print(userName);
          String userImage = userDoc['image'];
          print(userImage);
          print("===============================================================================================");

          // Generate a unique ID for the document
          String acceptid = FirebaseFirestore.instance.collection("ride_accept").doc().id;

          // Set the document with the generated ID
          await FirebaseFirestore.instance.collection("ride_accept").doc(acceptid).set({
            "acceptid": acceptid,
            "u_name": event.uname,
            "image" : event.image,
            "uid": user.uid,
            "request_user_id": event.requestUserId,
            'u_uid': event.fromuid,
            "pickup_location": event.pickuplocation,
            "drop_location": event.dropitlocation,
            "pickup_time": event.time,
            "pickupdate": event.date,
            "passenger_count": event.passengercount,
            "travel_expense": event.expence,
            "userimage": userImage,
            "Name": userName,
              "isRead": false,
          });

          print('Request added successfully');
        } else {
          print('User document does not exist.');
        }
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error adding request: $e');
    }
  }
}
