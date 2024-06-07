import 'package:flutter/material.dart';
import 'package:trek_trak/Application/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

class number_verifying extends StatelessWidget {
  final UserProfileLoadState state;
  const number_verifying({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
     final user = state.user;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.check_circle),
          color: CustomColor.greenColor(),
        ),
        TextButton(
            onPressed: () {},
            child: Text(state.user.number!,
                style: TextStyle(color: CustomColor.greenColor()))),
      ],
    );
  }
}

class email_verifying extends StatelessWidget {
  final UserProfileLoadState state;
  const email_verifying({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    final user = state.user;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
            onPressed: () {},
            child: Text("Confirm ${state.user.email}",
                style: TextStyle(color: CustomColor.greenColor()))),
      ],
    );
  }
}

class id_verifying extends StatelessWidget {
  const id_verifying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline_sharp),
            color: CustomColor.greenColor()),
        TextButton(
            onPressed: () {},
            child: Text(
              "verify my ID",
              style: TextStyle(color: CustomColor.greenColor()),
            )),
      ],
    );
  }
}
class add_preferences extends StatelessWidget {
  const add_preferences({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addPreference');
          },
          icon: const Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/addPreference');
            },
            child: Text("add my preferences",
                style: TextStyle(color: CustomColor.greenColor()))),
      ],
    );
  }
}

class mini_bio extends StatelessWidget {
  const mini_bio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline_sharp),
            color: CustomColor.greenColor()),
        TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/addBioScreen');
            },
            child: Text(
              "add a mini bio",
              style: TextStyle(color: CustomColor.greenColor()),
            )),
      ],
    );
  }
}