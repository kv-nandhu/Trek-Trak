
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleService {
  Future<void> updatevehicleNumber(String vnumber) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"vnumber": vnumber});
          
      print('vehicle number updated successfully');
      
    } catch (e) {
      print('Error updating vehicle number: $e');
    }
  }
  Future<void> updateVehicleModel(String vmodel) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"vmodel": vmodel});
      print('vehicle model updated successfully');
    } catch (e) {
      print('Error updating vehicle model: $e');
    }
  }
  Future<void> updatevehiclebrand(String vbrand) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"vbrand": vbrand});
      print('vehicle brand updated successfully');
    } catch (e) {
      print('Error updating vehicle brand: $e');
    }
  }
  Future<void> updateVehicleColor(String vcolor) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"vcolor": vcolor});
      print('vehicle color updated successfully');
    } catch (e) {
      print('Error updating vehicle color: $e');
    }
  }
  Future<void> updateVehicleType(String vtype) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"vtype": vtype});
      print('vehicle type updated successfully');
    } catch (e) {
      print('Error updating vehicle type: $e');
    }
  }
}