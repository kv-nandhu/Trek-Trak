import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class Agree {
  static Widget terms() {
    return Row(
      children: [
        Text(
          'By signing up you agree to the ',
          style: TextStyle(color: CustomColor.blackColor()),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'terms of service',
            style: TextStyle(
                color: CustomColor.greenColor(),
                decoration: TextDecoration.underline),
          ),
        ),
        Text(
          ' and',
          style: TextStyle(color: CustomColor.blackColor()),
        ),
      ],
    );
  }

  static Widget privacy() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'privacy policy',
            style: TextStyle(
                color: CustomColor.greenColor(),
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}

class loginAgain extends StatelessWidget {
  const loginAgain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(color: CustomColor.blackColor()),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            'Sign in',
            style: TextStyle(
                color: CustomColor.greenColor(),
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
