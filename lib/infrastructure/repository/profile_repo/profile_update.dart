
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileUpdate {
  Future<void> updateUserName(String name) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"Name": name});
          
      print('name updated successfully');
      
    } catch (e) {
      print('Error updating name: $e');
    }
  }
  Future<void> updateUserDob(String dob) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"dob": dob});
          
      print('date of birth updated successfully');
      
    } catch (e) {
      print('Error updating date of birth: $e');
    }
  }
  Future<void> updateUserNumber(String number) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"number": number});
          
      print('mobile number updated successfully');
      
    } catch (e) {
      print('Error updating mobile number: $e');
    }
  }
  Future<void> updateUserEmail(String email) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"Email": email});
          
      print('Email adress updated successfully');
      
    } catch (e) {
      print('Error updating email address: $e');
    }
  }
}
