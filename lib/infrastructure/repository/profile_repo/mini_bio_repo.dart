
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Future<void> updateUserMiniBio(String miniBio) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"miniBio": miniBio});
          
      print('MiniBio updated successfully');
      
    } catch (e) {
      print('Error updating MiniBio: $e');
    }
  }
  Future<void> updateUserAddress(String address, String companyAddress) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"address": address,"company_address": companyAddress});
          
          
      print('address updated successfully');
      
    } catch (e) {
      print('Error updating address: $e');
    }
  }

}
