// ignore_for_file: depend_on_referenced_packages

import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileRepo {
  Future<UserModel?> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming only one document matches the query
        UserModel userModel = UserModel.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);

        print('Name: ${userModel.name}');
        print('Email: ${userModel.email}');
        print('Gender: ${userModel.gender}');
        print('Number: ${userModel.number}');
        print('dob: ${userModel.dob}');
        print('image: ${userModel.image}');
        print(userModel);

        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<List<RidePublish>> getRide() async {
  List<RidePublish> publishing = [];
  User? user = FirebaseAuth.instance.currentUser;

  try {
    final documentSnapshot = await FirebaseFirestore.instance.collection('publish').get();

    documentSnapshot.docs.forEach((element) {
      // Extract data from the document snapshot
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      publishing.add(RidePublish.fromJson(data));
    });
    return publishing;

  } catch (e) {
    print('Error fetching ride publish: $e');
    return publishing;
  }
}

}
