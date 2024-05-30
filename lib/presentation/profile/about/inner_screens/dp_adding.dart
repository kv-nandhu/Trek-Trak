import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class ProfileAdding extends StatefulWidget {
  const ProfileAdding({super.key});

  @override
  State<ProfileAdding> createState() => _ProfileAddingState();
}

class _ProfileAddingState extends State<ProfileAdding> {
  String? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/editprofile');
                },
                label: Text(
                  "Back",
                  style: TextStyle(color: CustomColor.greenColor(), fontSize: 20),
                ),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColor.greenColor(),
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                  radius: 110,
                  backgroundImage: _selectedImage != null
                      ? FileImage(File(_selectedImage!))
                      : null,
                  child: _selectedImage == null ? const Text('🙈') : null),
            ),
            SizedBox(height: 200,),
             Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(context, '/sign');
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        backgroundColor: CustomColor.greenColor(),
                      ),
                      child: Text(
                        'Take a picture',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whiteColor(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
               TextButton(onPressed: (){}, child: Text("Choose a picture",style: TextStyle(fontSize: 24,color: CustomColor.greenColor()),))
          ],
        ),
      ),
    );
  }
}
