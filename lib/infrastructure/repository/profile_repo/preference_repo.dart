
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrefferenceUpdating {
  Future<void> updateChattiness(String chat) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"chat": chat});
      print('Chat updated successfully');
    } catch (e) {
      print('Error updating chat: $e');
    }
  }
  
  Future<void> updateSong(String song) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"song": song});
      print('song updated successfully');
    } catch (e) {
      print('Error updating song: $e');
    }
  }
  Future<void> updateSmoke(String smoke) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"smoke": smoke});
      print('smoke updated successfully');
    } catch (e) {
      print('Error updating smoke: $e');
    }
  }
  Future<void> updatePet(String pet) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"pet": pet});
      print('pet updated successfully');
    } catch (e) {
      print('Error updating pet: $e');
    }
  }
}
