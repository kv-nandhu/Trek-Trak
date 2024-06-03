import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class Dividers {
  static Widget line() {
    return Row(
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
        Text(
          "or",
          style: TextStyle(
            color: CustomColor.greyColor(),
          ),
        ),
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

  static Widget lineOne() {
    return Center(
      child: SizedBox(
        width: 370,
        child: Divider(
          thickness: 2,
          color: CustomColor.greyColor(),
        ),
      ),
    );
  }
}
class divider_thickness_big extends StatelessWidget {
  const divider_thickness_big({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: Divider(
        thickness: 6,
        color: CustomColor.greyColor(),
      ),
    );
  }
}

class divider_normal extends StatelessWidget {
  const divider_normal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Divider(
        thickness: 1,
        color: CustomColor.greyColor(),
      ),
    );
  }
}