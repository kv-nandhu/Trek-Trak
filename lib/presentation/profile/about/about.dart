import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                                      Navigator.pushReplacementNamed(context, '/editProfile');
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
                              icon: Icon(Icons.add_circle_outline_sharp),
                              color: CustomColor.greenColor(),
                            ),
                            TextButton(
                                onPressed: () {
                                       Navigator.pushReplacementNamed(context, '/personalDetail'); 
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
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      color: CustomColor.greyColor(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 400,
                  child: Divider(
                    thickness: 1,
                    color: CustomColor.greyColor(),
                  ),
                ),
                const Text(
                  "Verify your profile",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline_sharp),
                        color: CustomColor.greenColor()),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "verify my ID",
                          style: TextStyle(color: CustomColor.greenColor()),
                        )),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline_sharp),
                      color: CustomColor.greenColor(),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Confirm email kvnandhu09@gmail.com",
                            style: TextStyle(color: CustomColor.greenColor()))),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_circle),
                      color: CustomColor.greenColor(),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("+919778574297",
                            style: TextStyle(color: CustomColor.greenColor()))),
                  ],
                ),
                SizedBox(
                  width: 450,
                  child: Divider(
                    thickness: 6,
                    color: CustomColor.greyColor(),
                  ),
                ),
                const Text(
                  "About you",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline_sharp),
                        color: CustomColor.greenColor()),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "add a mini bio",
                          style: TextStyle(color: CustomColor.greenColor()),
                        )),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline_sharp),
                      color: CustomColor.greenColor(),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("add my preferences",
                            style: TextStyle(color: CustomColor.greenColor()))),
                  ],
                ),
                SizedBox(
                  width: 400,
                  child: Divider(
                    thickness: 1,
                    color: CustomColor.greyColor(),
                  ),
                ),
                const Text(
                  "Vehicles",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline_sharp),
                        color: CustomColor.greenColor()),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Add vehicles",
                          style: TextStyle(color: CustomColor.greenColor()),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
