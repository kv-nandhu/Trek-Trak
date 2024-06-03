import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/mybottom');
                },
                label: Text(
                  "Back",
                  style:
                      TextStyle(color: CustomColor.greenColor(), fontSize: 20),
                ),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColor.greenColor(),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                Text(
                                  "22 y/o",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: CustomColor.greytextColor(),
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: _selectedImage != null
                                  ? FileImage(File(_selectedImage!))
                                  : null,
                              child: _selectedImage == null
                                  ? const Text('🙈')
                                  : null,
                            ),
                          ],
                        ),
                        Text(
                          "Experience level: Newcomer",
                          style: TextStyle(color: CustomColor.greytextColor()),
                        ),
                        const SizedBox(height: 15),
                        const divider_normal(),
                   
                        TextButton.icon(
                          onPressed: () {},
                          label:  Text("Confirmed phone number",
                                style:
                                    TextStyle(color: CustomColor.greytextColor()),),
                       icon:  Icon(Icons.add_circle_outline_sharp,   color: CustomColor.greenColor(),),
                     
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          label:  Text("Confirmed email",
                                style:
                                    TextStyle(color: CustomColor.greytextColor()),),
                          icon:  Icon(Icons.add_circle_outline_sharp,   color: CustomColor.greenColor(),),
                        ),
                        const divider_thickness_big(),
                        const SizedBox(height: 10),
                        Text(
                          "About Nandhu Krishna",
                          style: TextStyle(
                            color: CustomColor.blackColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "I talk depending on my mood",
                          style: TextStyle(color: CustomColor.greytextColor()),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const divider_thickness_big(),
              const SizedBox(height: 14),
              Text(
                "Member since May 2024",
                style: TextStyle(color: CustomColor.greytextColor()),
              ),
                const SizedBox(height: 10),
                 Text(
                "1 ride published",
                style: TextStyle(color: CustomColor.greytextColor()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
