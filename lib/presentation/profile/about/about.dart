import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile_widget.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/vehicle_custom.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/verifying_custom.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

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
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if(state is UserProfileLoadState){

            
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!--------------profile adding , view profile, personal details-----------
                    profile_details(selectedImage: _selectedImage),
                    const divider_normal(),
                    const Text(
                      "Verify your profile",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!--------------id verifying-----------
                    const id_verifying(),
                    //!--------------email_verifying--------
                    const email_verifying(),
                    //!-------------- number_verifying------
                    const number_verifying(),
                    const divider_thickness_big(),
                    const Text(
                      "About you",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!-------------- mini_bio--------------
                    const mini_bio(),
                    //!-------------- add_preferences-------
                    const add_preferences(),

                    const divider_normal(),
                    const Text(
                      "Vehicles",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!-------------- vehicles_details-----
                    const vehicles_details(),
                  ],
                ),
              ),
            );
          }else{
             return Center(child: Text('Unknown state'));
          }
          }
        ),
      ),
    );
  }
}
