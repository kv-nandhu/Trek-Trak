import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/edit_personal/personal_details.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/profile_editing/edit_profile.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/Application/profile/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetails extends StatefulWidget {
  final UserModel userModel;
  final String? selectedImage;

  const ProfileDetails({
    super.key,
    required this.userModel,
    required this.selectedImage,
  });

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  String? _localSelectedImage;
  String? _firstName;
  String? _lastName;

  String imageurl =
      'https://littleooties.ca/wp-content/uploads/2022/07/AdobeStock_64672736_Preview.jpg';

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _localSelectedImage = widget.selectedImage;
  }

  void _getCurrentUser() async {
    try {
      final String fullName = widget.userModel.name ?? "";
      List<String> nameParts = fullName.split(' ');
      setState(() {
        _firstName = nameParts.length > 1
            ? nameParts.sublist(0, nameParts.length - 1).join(' ')
            : fullName;
        _lastName = nameParts.isNotEmpty ? nameParts.last : "";
      });
    } catch (error) {
      print("Error getting user data: $error"); // Handle potential errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoadState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _firstName?.isNotEmpty == true ? _firstName! : "Enter the name",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    _lastName?.isNotEmpty == true ? _lastName! : "Enter the name",
                    style: const TextStyle(fontSize: 30),
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
                          Navigator.pushReplacementNamed(context, '/ProfileAdd');
                        },
                        child: Text(
                          "Edit profile picture",
                          style: TextStyle(
                            color: CustomColor.greenColor(),
                          ),
                        ),
                      ),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalDetail(
                                selectedImage: _localSelectedImage,
                                userModel: widget.userModel,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Edit personal details",
                          style: TextStyle(
                            color: CustomColor.greenColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: _localSelectedImage != null
                    ? FileImage(File(_localSelectedImage!))
                    : NetworkImage(imageurl),
                child: _localSelectedImage == null ? null : null,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(
                        selectedImage: _localSelectedImage,
                        userModel: widget.userModel,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                color: CustomColor.greyColor(),
              ),
            ],
          );
        }
        return Center();
      },
    );
  }
}
