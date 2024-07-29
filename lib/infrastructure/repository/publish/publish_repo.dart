import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/Application/publish/publish_update/ride_publish_bloc.dart';

class RidePublishService {
  Future<void> updateRideTime(String time) async {
    
    try {
      if (time.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({"pickup_time": time});
        print('Time updated successfully');
      } else {
        print('Time is empty');
      }
    } catch (e) {
      print('Error updating time: $e');
    }
  }

  Future<void> updateRideDate(String date) async {
    try {
      if (date.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({"pickupdate": date});
        print('Date updated successfully');
      } else {
        print("Date is empty");
      }
    } catch (e) {
      print('Error updating date: $e');
    }
  }

  Future<void> updateRidePassengerCount(String passengercount) async {
    try {
      if (passengercount.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({"passenger_count": passengercount});
        print('Passenger count updated successfully');
      } else {
        print("Passenger count is empty");
      }
    } catch (e) {
      print('Error updating passenger count: $e');
    }
  }

  Future<void> updateRideExpense(String expense) async {
    try {
      if (expense.isNotEmpty) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance
              .collection("publish")
              .doc(user.uid)
              .update({"travel_expense": expense});
          print('Travel expense updated successfully');
        } else {
          print('No user is currently signed in.');
        }
      } else {
        print("Expense is empty");
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
            .update({
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

  Future<void> updateRideDropItLocation(String dropitlocation, String dropLatitude, String dropLongitude) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("publish")
            .doc(user.uid)
            .update({
          "drop_location": dropitlocation,
          "droplatitude": dropLatitude,
          "droplongitude": dropLongitude,
        });
        print('Drop-off location updated successfully');
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error updating drop-off location: $e');
    }
  }

  // Future<void> publishRide(PublishRideEvent event) async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     final fromuid = event.fromuid;
  //     if (user != null && fromuid != null) {
  //       await FirebaseFirestore.instance
  //           .collection("publish")
  //           .doc(fromuid)
  //           .set({
  //         "pickup_time": event.time,
  //         "pickupdate": event.date,
  //         "passenger_count": event.passengercount,
  //         "travel_expense": event.expence,
  //         "pickup_location": event.pickuplocation,
  //         "picklatitude": event.picklatitude,
  //         "picklongitude": event.picklongitude,
  //         "drop_location": event.dropitlocation,
  //         "droplatitude": event.droplatitude,
  //         "droplongitude": event.droplongitude,
  //       });
  //       print('Ride published successfully');
  //     } else {
  //       print('User is not authenticated or fromuid is null.');
  //     }
  //   } catch (e) {
  //     print('Error publishing ride: $e');
  //   }
  // }
}
