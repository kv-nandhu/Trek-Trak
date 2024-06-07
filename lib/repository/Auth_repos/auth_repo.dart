// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/presentation/authentication/otp_screen/otp_screen.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/success/success.dart';
import 'package:trek_trak/utils/bottomNaviationBar/bottom.dart';

Future<void> signInWithGoogle(BuildContext context, bool isUser) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
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
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null && isUser) {
        await firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "Name": user.displayName,
          "email": user.email,
          "profile": user.photoURL,
          'Gender': 'No declared',
          'phone': user.phoneNumber,
          'createdAt': DateTime.now(),
          'password': 'signwithgoogle',
        });
        Navigator.pushReplacementNamed(context, '/mybottom');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception is: $e");
    }
  }
}

String imageurl =
    'https://littleooties.ca/wp-content/uploads/2022/07/AdobeStock_64672736_Preview.jpg';

class FirebaseAuthentServices {
  String? verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<User?> signUpWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Error signing up: $e');
      throw Exception('Error signing up: $e');
    }
  }

  Future<User?> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> phoneNumberAuth(String number, String email, String name,
      String gender, BuildContext context) async {
    final phoneNumber = number;
    print(phoneNumber);
    try {
      if (phoneNumber.length == 10) {
        await _auth.verifyPhoneNumber(
          phoneNumber: "+91$phoneNumber",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print('Verification Failed: ${e.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Verification Failed: ${e.message}'),
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId = verificationId;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  verificationId: verificationId,
                  email: email,
                  gender: gender,
                  name: name,
                  number: number,
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            this.verificationId = verificationId;
          },
        );
      } else {
        print('Please enter a valid phone number');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a valid phone number'),
          ),
        );
      }
    } catch (e) {
      print('Error verifying phone number: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error verifying phone number: $e'),
        ),
      );
    }
  }

  Future<void> checkingOtp(String otp, String name, String gender, String email,
      String number, String verificationId, BuildContext context) async {
    try {
      FirebaseAuth.instance.getRedirectResult();

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordScreen(
              email: email,
              gender: gender,
              name: name,
              number: number,
            ),
          ),
        );
      });
    } catch (ex) {
      print(ex.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error verifying phone number: $ex'),
        ),
      );
    }
  }

  Future<void> signInWithGoogle(BuildContext context, bool isUser) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

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
            "Email": user.email,
            "profile": user.photoURL,
            'Gender': 'No declared',
            'phone': user.phoneNumber,
            'password': 'signwithgoogle',
            
          'street' : 'not declare',
          'city' : "city",
          'district' : "district",
          'dob': "dob"
          });
        }
      }
    } catch (e) {
      print("Exception is: $e");
    }
  }

  Future<void> registerUser({
    required BuildContext context,
    required String email,
    required String name,
    required String number,
    required String password,
    required String gender,
    required String street,
    required String city,
    required String district,
    required String dob
    // required String street,
  }) async {
    print('hellow check 1');
    print(name);
    print(email);
    print(number);
    print(gender);
    print(password);
    print(imageurl);
    final db = FirebaseFirestore.instance;
    User? user = await signUpWithEmailandPassword(
      email: email,
      password: password,
    );

    if (user != null) {
      print('User Successfully Created');
      try {
        final data = <String, String>{
          "Name": name,
          "Email": email,
          "number": number,
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'Gender': gender,
          'password': password,
          'profile': imageurl,
          'street' : street,
          'city' : city,
          'district' : district,
          'dob': dob
        };

        print('hellow check 3');
        await db
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(data);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessScreen(),
            ),
            (route) => false);
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('Something went wrong during user creation');
    }
  }

  void signIn(String email, String password, BuildContext context) async {
    await signInWithEmailandPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Succesfully'),
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyBottom()));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login have error :$error'),
        ),
      );
    });
  }
}
