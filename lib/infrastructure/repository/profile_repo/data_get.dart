// ignore_for_file: depend_on_referenced_packages

import 'package:trek_trak/domain/payment_model.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/domain/request_data.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileRepo {
  //!------------------------------user data geting -----------------------------------
  Future<UserModel?> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming only one document matches the query
        UserModel userModel = UserModel.fromJson(
            querySnapshot.docs.first.data());
        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
//!-------------------------------------------ride publish update --------------------------------
  Future<List<RidePublish>> getRide() async {
    List<RidePublish> publishing = [];
    User? user = FirebaseAuth.instance.currentUser;
    try {
      final documentSnapshot =
          await FirebaseFirestore.instance.collection('publish').get();

      documentSnapshot.docs.forEach((element) {
        // Extract data from the document snapshot
        Map<String, dynamic> data = element.data();
        publishing.add(RidePublish.fromJson(data));
      });
      print("-------------------------------------------------------");
      print(publishing);
      return publishing;
    } catch (e) {
      print('Error fetching ride publish: $e');
      return publishing;
    }
  }
//!----------------------------------------------ride publish induvitual -------------------------------
  Future<List<RidePublish>> getInduvitual() async {
    List<RidePublish> publishing = [];
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection('publish')
          .where('uid', isEqualTo: user!.uid)
          .get();

      documentSnapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        publishing.add(RidePublish.fromJson(data));
      });
      return publishing;
    } catch (e) {
      print('Error fetching ride publish: $e');
      return publishing;
    }
  }

  Future<UserModel?> getInduvitualUser(String uid) async {
    try {
      print(uid);
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      print("step 1");
      if (querySnapshot.docs.isNotEmpty) {
        print("step 2");
        print(querySnapshot.docs.first.data());
        // Assuming only one document matches the query
        UserModel userModel =
            UserModel.fromJson(querySnapshot.docs.first.data());

        print("step 3");
        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

Future<List<RidePublish>> searchRides(String from, String to, String date) async {
  // Fetch all rides from your data source
  final allRides = await getRide();
  
  // Filter the rides based on the search criteria
  return allRides.where((ride) {
    final pickupLocation = ride.pickuplocation?.toLowerCase() ?? '';
    final dropLocation = ride.dropitlocation?.toLowerCase() ?? '';
    final rideDate = ride.date ?? '';
print(pickupLocation);
print(dropLocation);
print(rideDate);
print(from);
print(to);
print(date);
    return pickupLocation.contains(from.toLowerCase()) &&
           dropLocation.contains(to.toLowerCase()) &&
           rideDate.contains(date);
  }).toList();
}





  Future<List<UserRequest>> getRequestRideUser() async {
    List<UserRequest> requestList = [];
     User? user = FirebaseAuth.instance.currentUser;

    try {
      // print('Fetching requests for publishId: $publishid');
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user_request')
          .where('uid', isEqualTo: user!.uid)
          .get();

      print('Raw document snapshot: ${querySnapshot.docs.length} documents found');
      
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        print('Fetched data: $data');
        requestList.add(UserRequest.fromJson(data));
      }

      print('Request List: $requestList');
      return requestList;
    } catch (e) {
      print('Error fetching requests: $e');
      return requestList;
    }
  }



   Future<List<RideAccepted>> getAcceptedRide() async {
    List<RideAccepted> rideAccepted = [];
     User? user = FirebaseAuth.instance.currentUser;

    try {
      // print('Fetching requests for publishId: $publishid');
      final querySnapshot = await FirebaseFirestore.instance
          .collection('ride_accept')
          .where('request_user_id', isEqualTo: user!.uid)
          .get();

      print('Raw document snapshot: ${querySnapshot.docs.length} documents found');
      
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        print('Fetched data: $data');
        rideAccepted.add(RideAccepted.fromJson(data));
      }

      print('Request List: $rideAccepted');
      return rideAccepted;
    } catch (e) {
      print('Error fetching requests: $e');
      return rideAccepted;
    }
  }


  Future<void> markNotificationAsRead(String uid) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final querySnapshot = await FirebaseFirestore.instance
          .collection('ride_accept')
          .where('request_user_id', isEqualTo: user!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await FirebaseFirestore.instance.collection('ride_accept').doc(docId).update({
          'isRead': true,
        });
      }
    } catch (e) {
      print('Error updating notification status: $e');
    }
  }

Future<List<RideAccepted>> getAcceptedUsersForPublishedRide(String fromuid) async {
  try {
    final publishedRides = await getInduvitual();
    if (publishedRides.isEmpty) {
      return []; 
    }
    final matchingRides = publishedRides.where(
      (ride) => ride.fromuid == fromuid,
    ).toList();

    if (matchingRides.isEmpty) {
      return []; 
    }

    final acceptid = matchingRides.first.fromuid;
    if (acceptid == null) {
      throw Exception('acceptid is missing in published ride details');
    }
    final acceptedUsersSnapshot = await FirebaseFirestore.instance
        .collection('ride_accept')
        .where('u_uid', isEqualTo: acceptid)
        .get();

    return acceptedUsersSnapshot.docs
        .map((doc) => RideAccepted.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Failed to fetch accepted users for published ride: $e');
    return [];
  }
}




Future<List<RideAccepted>> userAccepteduser() async {
  try {  
        User? user = FirebaseAuth.instance.currentUser;
    final acceptedUsersSnapshot = await FirebaseFirestore.instance
        .collection('ride_accept')
        .where('uid', isEqualTo: user!.uid )
        .get();

    return acceptedUsersSnapshot.docs
        .map((doc) => RideAccepted.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Failed to fetch accepted users for published ride: $e');
    return [];
  }
}



Future<List<Payment>> paymentRequestGet() async {
  try {  
        User? user = FirebaseAuth.instance.currentUser;
    final acceptedUsersSnapshot = await FirebaseFirestore.instance
        .collection('payment_request')
        .where('user_id', isEqualTo: user!.uid )
        .get();

    return acceptedUsersSnapshot.docs
        .map((doc) => Payment.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Failed to fetch accepted users for published ride: $e');
    return [];
  }
}
}