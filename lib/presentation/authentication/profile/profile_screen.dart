import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_button.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_widget/profile_fields.dart';


class UserData extends StatefulWidget {
   String?  email,name,password,gender;
   UserData({super.key,required this.email,required this.gender,required this.name,required this.password});
 
  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: [
                    ProfileFields.imageFields(),
                    ProfileFields.nameFields(),
                    ProfileFields.dobField(context),
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
          ),
        )),
    );
  }
}