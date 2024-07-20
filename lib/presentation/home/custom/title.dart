import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class title extends StatelessWidget {
  const title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: 'TREK',
            style: TextStyle(
              color: CustomColor.greenColor(),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            children: const [
              TextSpan(
                text: ' TRAK',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            height: 40,
            width: 50,
            child: Image.asset('images/heading.jpg'))
      ],
    );
  }}