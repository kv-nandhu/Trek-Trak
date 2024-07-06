
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileImage {
  Future<void> updateUserProfieImage(String image) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"image": image});
          
      print('image updated successfully');
      
    } catch (e) {
      print('Error updating image: $e');
    }
  }
}
