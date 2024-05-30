import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_button.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_fields.dart';


class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  ProfileFields.imageFields(),
                  ProfileFields.nameFields(),
                  ProfileFields.phoneFields(),
                  ProfileFields.emailFields(),
                  ProfileFields.streetFields(),
                  ProfileFields.cityFields(),
                  ProfileFields.districtFields(),
                    const SizedBox(height: 20,),
                  UserButtons.userButton(context),
                ],
              ),
            ),
          ),
        )),
    );
  }
}