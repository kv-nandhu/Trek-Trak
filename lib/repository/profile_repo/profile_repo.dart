// ignore_for_file: depend_on_referenced_packages

import 'package:trek_trak/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileRepo {
  Future<UserModel?> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user!.uid)
          .get();
          
          if(data.docs.isNotEmpty) {
       UserModel userModel = UserModel.fromJson(data.docs.first.data());
     
        print('Name: ${userModel.name}');
        print('Email: ${userModel.email}');
        print('Gender: ${userModel.gender}');
        print('Number: ${userModel.number}');
        return userModel;
            
          }else{
            return null;
          }
    } catch (e) {
      return null;
    }
  }
}
