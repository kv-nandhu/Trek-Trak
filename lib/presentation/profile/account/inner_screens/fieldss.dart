import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/infrastructure/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/presentation/profile/account/inner_screens/postal_address.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/utils/color/color.dart';

class CloseAccount extends StatelessWidget {
  const CloseAccount({super.key});

  Future<void> _deleteAccount(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).delete();
        await user.delete();
        Navigator.of(context).popUntil((route) => route.isFirst); 
      } else {
        _showErrorDialog(context, 'No user is currently signed in.');
      }
    } catch (error) {
      _showErrorDialog(context, error.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _deleteAccount(context),
      child: Text(
        "Close account",
        style: TextStyle(color: CustomColor.greenColor()),
      ),
    );
  }
}

class moreInfo extends StatelessWidget {
  const moreInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "More INFO",
              style: TextStyle(color: CustomColor.blackColor()),
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}

class DataProtection extends StatelessWidget {
  const DataProtection({
    super.key,
  });

  // Define the URL for the privacy policy
  final String _privacyPolicyUrl = 'https://www.freeprivacypolicy.com/live/5fe61166-baaf-41e8-ba1a-eef51a978686';

  // Function to launch the URL
  Future<void> _launchURL() async {
    // ignore: deprecated_member_use
    if (await canLaunch(_privacyPolicyUrl)) {
      // ignore: deprecated_member_use
      await launch(_privacyPolicyUrl);
    } else {
      throw 'Could not launch $_privacyPolicyUrl';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _launchURL, // Call the _launchURL function when pressed
          child: Text(
            "Data Protection",
            style: TextStyle(color: CustomColor.blackColor()),
          ),
        ),
        IconButton(
          onPressed: _launchURL, // Call the _launchURL function when pressed
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  final String _termsAndConditions = 'https://www.termsfeed.com/live/58a531af-8471-42b4-a5d2-71758c8cee4d';

  Future<void> _launchURLTermsandCondition() async {
    final Uri url = Uri.parse(_termsAndConditions);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $_termsAndConditions';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            _launchURLTermsandCondition(); // Add parentheses to call the method
          },
          child: Text(
            "Terms & Conditions",
            style: TextStyle(color: CustomColor.blackColor()),
          ),
        ),
        IconButton(
          onPressed: () {
            _launchURLTermsandCondition(); // Add parentheses to call the method
          },
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }
}
class postalAddress extends StatelessWidget {
  const postalAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Postal address",
              style: TextStyle(color: CustomColor.blackColor()),
            )),
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddressFormScreen()));
              
            },
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}

class changePaswword extends StatelessWidget {
  const changePaswword({
    super.key,
    required this.pass,
  });

  final ResetPassRespo pass;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          pass.resetPassword(context, emailController.text);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Change password",
              style: TextStyle(color: CustomColor.blackColor()),
            ),
            IconButton(
                onPressed: () {
                  pass.resetPassword(context, emailController.text);
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ));
  }
}

class rating extends StatelessWidget {
  const rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Rating",
              style: TextStyle(color: CustomColor.blackColor()),
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}


class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
                 
          showLogoutDialog(context);
        },
        child: Text(
          "Log out",
          style: TextStyle(color: CustomColor.greenColor()),
        ));
  }
}



 void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log out'),
              onPressed: () {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(LogoutEvent());
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }