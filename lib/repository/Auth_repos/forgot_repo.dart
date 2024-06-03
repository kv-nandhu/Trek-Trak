// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassRespo {
  void resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _showDialog(
        context,
        'Password reset link sent! Check your email.',
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      _showErrorDialog(context, e.message.toString());
    } catch (e) {
      print(e);
      _showErrorDialog(context, e.toString());
    }
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Navigator.of(context).pop();

                forgotBack(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> forgotBack(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
