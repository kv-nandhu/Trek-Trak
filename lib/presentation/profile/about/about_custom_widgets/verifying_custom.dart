import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/doc_verifyng/verifyng_screen.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberVerifying extends StatelessWidget {
  final UserProfileLoadState state;
  const NumberVerifying({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final user = state.user;
    bool isVerified = user.number != null && user.number!.isNotEmpty;

    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: isVerified
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            isVerified ? user.number! : "Verify number",
            style: TextStyle(color: CustomColor.greenColor()),
          ),
        ),
      ],
    );
  }
}

class EmailVerifying extends StatelessWidget {
  final UserProfileLoadState state;
  const EmailVerifying({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final user = state.user;
    bool isVerified = user.email != null && user.email!.isNotEmpty;

    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: isVerified
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            isVerified ? "Confirmed ${user.email}" : "Confirm email",
            style: TextStyle(color: CustomColor.greenColor()),
          ),
        ),
      ],
    );
  }
}

class IdVerifying extends StatelessWidget {
  const IdVerifying({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with actual verification logic
    bool isVerified = false;

    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: isVerified
              // ignore: dead_code
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
          onPressed: () {
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Scanner()));
          },
          child: Text(
            "Verify my ID",
            style: TextStyle(color: CustomColor.greenColor()),
          ),
        ),
      ],
    );
  }
}

class AddPreferences extends StatelessWidget {
  final String? chatiness;
  const AddPreferences({super.key, required this.chatiness});

  @override
  Widget build(BuildContext context) {
    bool isAdded = chatiness != null && chatiness!.isNotEmpty;

    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addPreference');
          },
          icon: isAdded
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addPreference');
          },
          child: Text(
            "Add my preferences",
            style: TextStyle(color: CustomColor.greenColor()),
          ),
        ),
      ],
    );
  }
}

class MiniBio extends StatelessWidget {
  final String? bio;
  const MiniBio({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    bool isAdded = bio != null && bio!.isNotEmpty;

    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addBioScreen');
          },
          icon: isAdded
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addBioScreen');
          },
          child: Text(
            isAdded ? bio! : 'Add mini bio',
            style: TextStyle(color: CustomColor.greenColor()),
          ),
        ),
      ],
    );
  }
}
