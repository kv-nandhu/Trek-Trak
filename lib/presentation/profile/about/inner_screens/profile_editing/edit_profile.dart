import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextButton.icon(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, '/profile');
              },
              label: Text(
                "Back",
                style: TextStyle(
                    color: CustomColor.greenColor(), fontSize: 20),
              ),
              icon: Icon(
                Icons.arrow_back_ios,
                color: CustomColor.greenColor(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nandhu Krishna",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline_sharp),
                            color: CustomColor.greenColor()),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Confirmed phone number",
                              style: TextStyle(color: CustomColor.greyColor()),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("About Nandhu krishna",
                        style: TextStyle(
                            color: CustomColor.blackColor(),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("I talk depending on my mood",
                        style: TextStyle(color: CustomColor.greyColor())),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
               Navigator.pushReplacementNamed(context, '/ProfileAdd');
          },
                  child: CircleAvatar(
                  
                      radius: 55,
                      backgroundImage: _selectedImage != null
                          ? FileImage(File(_selectedImage!))
                          : null,
                      child: _selectedImage == null ? const Text('🙈') : null),
                ),
              ],
            ),
            SizedBox(
              width: 450,
              child: Divider(
                thickness: 6,
                color: CustomColor.greyColor(),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text("Member since May 2024",
                style: TextStyle(color: CustomColor.greyColor()))
          ]),
        ),
      ),
    );
  }
}
