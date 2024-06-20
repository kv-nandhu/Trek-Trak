import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

class EditProfile extends StatefulWidget {
  final UserModel userModel;

  const EditProfile({super.key, required this.userModel});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Function to format date string to yyyy-MM-dd
  String formatDateString(String date) {
    List<String> parts = date.split('-');
    if (parts.length == 3) {
      String year = parts[0];
      String month = parts[1].padLeft(2, '0');
      String day = parts[2].padLeft(2, '0');
      return '$year-$month-$day';
    }
    return date;
  }

  // Function to calculate age from date of birth
  int calculateAge(String dob) {
    DateTime today = DateTime.now();
    try {
      String formattedDob = formatDateString(dob);
      DateTime parsedDate = DateTime.parse(formattedDob);
      int age = today.year - parsedDate.year;
      return age;
    } catch (e) {
      print("Error parsing date: $e");
      return 0; // Return 0 or handle the error appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.userModel;
    final userAge = user.dob != null ? calculateAge(user.dob!) : 'N/A';

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoadState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/mybottom');
                      },
                      label: Text(
                        "Back",
                        style: TextStyle(
                          color: CustomColor.greenColor(),
                          fontSize: 20,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: CustomColor.greenColor(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.name.toString(),
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        "$userAge y/o", // Display the user's age
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: CustomColor.greytextColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProfileBuildBloc>(context)
                                          .add(ChangeImageEvent());
                                      // BlocProvider.of<ProfileBuildBloc>(context)
                                      //     .add(ProfileImagePickerEvent());
                                    },
                                    child: CircleAvatar(
                                      radius: 55,
                                      backgroundImage: state.user.image! != null
                                          ? NetworkImage(state.user.image!)
                                          : null,
                                      child: state.user.image! == null
                                          ? Icon(Icons.person,
                                              size: 60) // Placeholder icon
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Experience level: Newcomer",
                                style: TextStyle(
                                  color: CustomColor.greytextColor(),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const divider_normal(),
                              TextButton.icon(
                                onPressed: () {},
                                label: Text(
                                  user.number!,
                                  style: TextStyle(
                                    color: CustomColor.greytextColor(),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: CustomColor.greenColor(),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                label: Text(
                                  user.email!,
                                  style: TextStyle(
                                    color: CustomColor.greytextColor(),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: CustomColor.greenColor(),
                                ),
                              ),
                              const divider_thickness_big(),
                              const SizedBox(height: 10),
                              Text(
                                "About ${user.name}",
                                style: TextStyle(
                                  color: CustomColor.blackColor(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                user.miniBio!,
                                style: TextStyle(
                                  color: CustomColor.greytextColor(),
                                ),
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
                );
              }
              return Center();
            },
          ),
        ),
      ),
    );
  }
}
