// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:trek_trak/Application/publish_update/ride_publish_bloc.dart';


// class RidePublishService {
//   Future<void> updateRideTime(String time) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection("publish")
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .update({"pickup_time": time});
          
//       print('Time updated successfully');
      
//     } catch (e) {
//       print('Error updating time: $e');
//     }
//   }

//   Future<void> updateRideDate(String date) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection("publish")
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .update({"pickupdate": date});
          
//       print('Date updated successfully');
      
//     } catch (e) {
//       print('Error updating date: $e');
//     }
//   }

//   Future<void> updateRidePassengerCount(String passengercount) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection("publish")
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .update({"passenger_count": passengercount});
          
//       print('Passenger count updated successfully');
      
//     } catch (e) {
//       print('Error updating passenger count: $e');
//     }
//   }
//   Future<void> updateRideExpense(String expense) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         await FirebaseFirestore.instance
//             .collection("publish")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//             .update({"travel_expense": expense});
//         print('Travel expense updated successfully');
//       } else {
//         print('No user is currently signed in.');
//       }
//     } catch (e) {
//       print('Error updating travel expense: $e');
//     }
//   }

//   Future<void> updateRidePickupLocation(String pickupLocation, String pickLatitude, String pickLongitude) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;

//       if (user != null) {
//         await FirebaseFirestore.instance
//             .collection("publish")
//             .doc(user.uid)
//             .update({
//           "pickup_location": pickupLocation,
//           "pick_latitude": pickLatitude,
//           "pick_longitude": pickLongitude,
//         });

//         print('Pickup location updated successfully');
//       } else {
//         print('No user is currently signed in.');
//       }
//     } catch (e) {
//       print('Error updating pickup location: $e');
//     }
//   }

//   Future<void> updateRideDropItLocation(String dropitlocation, String droplatitude, String droplongitude) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;

//       if (user != null) {
//         await FirebaseFirestore.instance
//             .collection("publish")
//             .doc(user.uid)
//             .update({
//           "dropit": dropitlocation,
//           "drop_latitude": droplatitude,
//           "drop_longitude": droplongitude,
//         });

//         print('Drop-off location updated successfully');
//       } else {
//         print('No user is currently signed in.');
//       }
//     } catch (e) {
//       print('Error updating drop-off location: $e');
//     }
//   }

//   Future<void> publishRide(PublishRideEvent event) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;

//       if (user != null) {
//         await FirebaseFirestore.instance
//             .collection("publish")
//             .doc(user.uid)
//             .update({
//               "u_uid" : user.uid,
              
//           "pickup_location": event.pickuplocation,
//           "drop_location": event.dropitlocation,
//           "middle_city": event.middlecity,
//           "pickup_time": event.time,
//           "pickupdate": event.date,
//           "passenger_count": event.passengercount,
//           "droplatitude": event.droplatitude,
//           "droplongitude": event.droplongitude,
//           "picklatitude": event.picklatitude,
//           "picklongitude": event.picklongitude,
//           "travel_expense": event.expence,
//         });

//         print('Ride published successfully');
//       } else {
//         print('No user is currently signed in.');
//       }
//     } catch (e) {
//       print('Error publishing ride: $e');
//     }
//   }
// }
