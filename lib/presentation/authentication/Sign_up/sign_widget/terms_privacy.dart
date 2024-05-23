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

  static Widget account() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(color: CustomColor.blackColor()),
        ),
        GestureDetector(
          onTap: () {},
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
