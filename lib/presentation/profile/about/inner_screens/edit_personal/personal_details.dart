import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_dob.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_email.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_name.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_number.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetail extends StatefulWidget {
  final UserModel userModel;
  final String? selectedImage;
  const PersonalDetail({
    Key? key,
    required this.userModel,
    required this.selectedImage,
  }) : super(key: key);

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  String? _firstName;
  String? _lastName;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    // context.read<ProfileBloc>().add(GetUserEvent());
  }

  void _getCurrentUser() async {
    try {
      if (widget.userModel != null) {
        final String fullName = widget.userModel.name ?? "";
        print(fullName);
        List<String> nameParts = fullName.split(' ');
        setState(() {
          _firstName = nameParts.length > 1
              ? nameParts.sublist(0, nameParts.length - 1).join(' ')
              : fullName;
          _lastName = nameParts.isNotEmpty ? nameParts.last : "";
        });
      }
      print(_firstName);
      print("--------------------");
    } catch (error) {
      print("Error getting user data: $error"); // Handle potential errors
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.userModel;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoadState) {
                List fs = state.user.name.toString().split(' ');

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/mybottom');
                        },
                        label: Text(
                          "Back",
                          style: TextStyle(
                            color: CustomColor.greenColor(),
                            fontSize: 15,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: CustomColor.greenColor(),
                          size: 15,
                        ),
                      ),
                    ),
                    Title(
                      color: CustomColor.blackColor(),
                      child: Text(
                        "Personal details",
                        style: TextStyle(
                          color: CustomColor.blackColor(),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("User name"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserNameEditing(
                              userModel: state.user,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        widget.userModel.name!,
                        style: TextStyle(
                          color: CustomColor.greenColor(),
                          fontSize: 19,
                          height: 0.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Date of birth"),
                    ),
                    TextButton(
                      onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDobEditing(
                              userModel: state.user,
                            ),
                            
                          ),
                        );
                      },
                      child: Text(
                        state.user.dob!, // This should be dynamically fetched
                        style: TextStyle(
                          color: CustomColor.greenColor(),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Mobile phone"),
                    ),
                    TextButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserNumberEditing(
                              userModel: state.user,
                            ),
                            
                          ),
                        );
                      },
                      child: Text(
                        state.user.number!,
                        style: TextStyle(
                          color: CustomColor.greenColor(),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Email Address"),
                    ),
                    TextButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserEmailEditing(
                              userModel: state.user,
                            ),
                            
                          ),
                        );
                      },
                      child: Text(
                        state.user.email!,
                        style: TextStyle(
                          color: CustomColor.greenColor(),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 410,
                      child: Divider(
                        thickness: 2,
                        color: CustomColor.greyColor(),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline_sharp),
                          color: CustomColor.greenColor(),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Add mini bio",
                            style: TextStyle(
                              color: CustomColor.greenColor(),
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                );
              }
              return const Center(child: Text('Loading...'));
            },
          ),
        ),
      ),
    );
  }
}
