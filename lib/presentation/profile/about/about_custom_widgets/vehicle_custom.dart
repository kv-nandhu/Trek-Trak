import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class vehicles_details extends StatelessWidget {
  const vehicles_details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
   Navigator.pushReplacementNamed(context, '/PlateNumber');
            },
            icon: const Icon(Icons.add_circle_outline_sharp),
            color: CustomColor.greenColor()),
        TextButton(
            onPressed: () {
                 Navigator.pushReplacementNamed(context, '/PlateNumber');
            },
            child: Text(
              "Add vehicles",
              style: TextStyle(color: CustomColor.greenColor()),
            )),
      ],
    );
  }
}