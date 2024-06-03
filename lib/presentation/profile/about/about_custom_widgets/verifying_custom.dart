import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class number_verifying extends StatelessWidget {
  const number_verifying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.check_circle),
          color: CustomColor.greenColor(),
        ),
        TextButton(
            onPressed: () {},
            child: Text("+919778574297",
                style: TextStyle(color: CustomColor.greenColor()))),
      ],
    );
  }
}

class email_verifying extends StatelessWidget {
  const email_verifying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_circle_outline_sharp),
          color: CustomColor.greenColor(),
        ),
        TextButton(
            onPressed: () {},
            child: Text("Confirm email kvnandhu09@gmail.com",
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