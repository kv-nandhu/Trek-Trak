import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class Dividers {
  static Widget line() {
   return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Divider(
            thickness: 2,
           color: CustomColor.greyColor(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text("or",style: TextStyle(  color: CustomColor.greyColor(),),),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 120,
          child: Divider(
            thickness: 2,
             color: CustomColor.greyColor(),
          ),
        )
      ],
    );
  }
}
