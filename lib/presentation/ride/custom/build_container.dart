import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

Widget buildNavContainer(BuildContext context, String text, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: backgroundColors[
                                    Random().nextInt(backgroundColors.length)], // Inner color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(
          color: Colors.green, // Border color
          width: 2, // Border width
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
    ),
  );
}