import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class profile_details extends StatelessWidget {
  const profile_details({
    super.key,
    required String? selectedImage,
  }) : _selectedImage = selectedImage;

  final String? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              "Nandhu \n Krishna",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle_outline_sharp),
                    color: CustomColor.greenColor()),
                TextButton(
                    onPressed: () {
                           Navigator.pushReplacementNamed(context, '/ProfileAdd');
                    },
                    child: Text(
                      "Edit profile picture",
                      style: TextStyle(
                          color: CustomColor.greenColor()),
                    )),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline_sharp),
                  color: CustomColor.greenColor(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/personalDetail');
                    },
                    child: Text("Edit personal details",
                        style: TextStyle(
                            color: CustomColor.greenColor()))),
              ],
            )
          ],
        ),
        CircleAvatar(
            radius: 60,
            backgroundImage: _selectedImage != null
                ? FileImage(File(_selectedImage!))
                : null,
            child:
                _selectedImage == null ? const Text('🙈') : null),
        IconButton(
          onPressed: () {
      
             Navigator.pushReplacementNamed(
                          context, '/editProfile');
          },
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: CustomColor.greyColor(),
        ),
      ],
    );
  }
}