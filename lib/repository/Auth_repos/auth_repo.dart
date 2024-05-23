import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

Future<void> signInWithGoogle(BuildContext context, bool isUser) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      print(user);

      if (user != null && isUser) {
        await firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "Name": user.displayName,
          "email": user.email,
          "profile": user.photoURL,
          'Gender': 'No declared',
          'phone': '+91000000000',
          'createdAt': DateTime.now(),
          'password': 'signwithgoogle',
        });
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  } catch (e) {
    print("Exception is: $e");
  }
}
