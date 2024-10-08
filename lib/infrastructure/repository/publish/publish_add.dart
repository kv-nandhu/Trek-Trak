import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/Application/publish/publish_add/publish_add_bloc.dart';
import 'package:trek_trak/Application/publish/publish_update/ride_publish_bloc.dart';

class RidePublishAddingService {
  Future<void> updateRideTime(String time) async {
    try {
      await FirebaseFirestore.instance
          .collection("publish")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"pickup_time": time});
      print('Time updated successfully');
    } catch (e) {
      print('Error updating time: $e');
    }
  }

  Future<void> updateRideDate(String date) async {
    try {
      await FirebaseFirestore.instance
          .collection("publish")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"pickupdate": date});
      print('Date updated successfully');
    } catch (e) {
      print('Error updating date: $e');
    }
  }

  Future<void> updateRidePassengerCount(String passengercount) async {
    try {
      await FirebaseFirestore.instance
          .collection("publish")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"passenger_count": passengercount});
      print('Passenger count updated successfully');
    } catch (e) {
      print('Error updating passenger count: $e');
    }
  }

  Future<void> updateRideExpense(String expense) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({"travel_expense": expense});
        print('Travel expense updated successfully');
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error updating travel expense: $e');
    }
  }

  Future<void> updateRidePickupLocation(String pickupLocation, String pickLatitude, String pickLongitude) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(user.uid)
            .set({
          "pickup_location": pickupLocation,
          "picklatitude": pickLatitude,
          "picklongitude": pickLongitude,
        });

        print('Pickup location updated successfully');
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error updating pickup location: $e');
    }
  }

  Future<void> updateRideDropItLocation(String dropitlocation, String droplatitude, String droplongitude) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(user.uid)
            .set({
          "drop_location": dropitlocation,
          "droplatitude": droplatitude,
          "droplongitude": droplongitude,
        });

        print('Drop-off location updated successfully');
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error updating drop-off location: $e');
    }
  }

 
  Future<void> addRide(AddRidePublishEvent event) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Generate a unique ID for the document
      String fromuid = FirebaseFirestore.instance.collection("publish").doc().id;

      // Set the document with the generated ID
      await FirebaseFirestore.instance
          .collection("publish")
          .doc(fromuid)
          .set({
        "u_name": event.uname,
        "uid": user.uid,
        'u_uid': fromuid,
        "pickup_location": event.pickuplocation,
        "drop_location": event.dropitlocation,
        "middle_city": event.middlecity,
        "pickup_time": event.time,
        "pickupdate": event.date,
        "passenger_count": event.passengercount,
        "droplatitude": event.droplatitude,
        "droplongitude": event.droplongitude,
        "picklatitude": event.picklatitude,
        "picklongitude": event.picklongitude,
        "travel_expense": event.expence,
      });

      print('Ride added successfully');
    } else {
      print('No user is currently signed in.');
    }
  } catch (e) {
    print('Error adding ride: $e');
  }
}
}