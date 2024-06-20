import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class number_verifying extends StatelessWidget {
  final UserProfileLoadState state;
  const number_verifying({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final user = state.user;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check_circle),
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
  const email_verifying({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final user = state.user;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline_sharp),
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
            icon: const Icon(Icons.add_circle_outline_sharp),
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
   add_preferences({
    super.key,required this.chatiness,
  });
String? chatiness;
  @override
  Widget build(BuildContext context) {
     bool isAddedchar = (chatiness == '') ? true : false;
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
            child: Text(
              "add my preferences",
                style: TextStyle(color: CustomColor.greenColor()))),
      ],
    );
  }
}

class mini_bio extends StatelessWidget {
  mini_bio({super.key, required this.bio});
  String? bio;

  @override
  Widget build(BuildContext context) {
    bool isAdded = (bio == '') ? true : false;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addBioScreen');
          },
          icon: isAdded ==true? const Icon(Icons.add_circle_outline_sharp): const Icon(Icons.add),
          color: CustomColor.greenColor(),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addBioScreen');
          },
          child: Text(
            isAdded ? 'add mini bio': bio! ,
            style: TextStyle(color: CustomColor.greenColor()),
          ),
        ),
      ],
    );
  }
}
