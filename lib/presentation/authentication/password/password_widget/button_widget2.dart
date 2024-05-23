import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';


class ButtonsRegister {
  static register(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/UserData');
        },
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColor.greenColor(),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CustomColor.whiteColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
