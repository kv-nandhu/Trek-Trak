// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile_widget.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/vehicle_custom.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/verifying_custom.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/vehicle_details.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool smokeisTrue = false;
  String? pickedImage;
  late final UserProfileLoadState state;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(GetUserEvent());
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserProfileLoadState) {
            if (state.user.smoke == 'smokes') {
              smokeisTrue = false;
            } else {
              smokeisTrue = true;
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!--------------profile adding , view profile, personal details-----------
                    ProfileDetails(
                      pickedImage: pickedImage,
                      userModel: state.user,
                    ),
                    const divider_normal(),
                    const Text(
                      "Verify your profile",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!--------------id verifying-----------
                    const id_verifying(),
                    //!--------------email_verifying--------
                    email_verifying(state: state),
                    //!-------------- number_verifying------
                    number_verifying(state: state),
                    const divider_thickness_big(),
                    const Text(
                      "About you",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!-------------- mini_bio--------------
                    mini_bio(bio: state.user.miniBio ?? 'No data'),
                    //!-------------- add_preferences-------

                    state.user.chat == 'chattiness'
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.message,
                                    color: CustomColor.greyColor()),
                                const SizedBox(width: 20),
                                Text(state.user.chat!)
                              ],
                            ),
                          ),

                    const SizedBox.shrink(),

                    //  if (state.user.song != null || state.user.song=="songs")
                    state.user.song == 'songs'
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.music_note,
                                    color: CustomColor.greyColor()),
                                const SizedBox(width: 20),
                                Text(state.user.song ??
                                    "add the music preference"),
                              ],
                            ),
                          ),
                    state.user.smoke == 'smokes'
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.smoking_rooms_rounded,
                                    color: CustomColor.greyColor()),
                                const SizedBox(width: 20),
                                Text(state.user.smoke ??
                                    "add the smoke preference"),
                              ],
                            ),
                          ),

                    state.user.pet == 'pets'
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.pets,
                                    color: CustomColor.greyColor()),
                                const SizedBox(width: 20),
                                Text(
                                    state.user.pet ?? "add the pet preference"),
                              ],
                            ),
                          ),

                    add_preferences(chatiness: state.user.chat),
                    const divider_normal(),
                    const Text(
                      "Vehicles",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!-------------- vehicles_details-----
                    state.user.vcolor == 'vehicle color'
                        ? SizedBox()
                        : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${state.user.vbrand!} ${state.user.vmodel!}',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      state.user.vcolor!,
                                      style: TextStyle(
                                          color: CustomColor.greyColor(),
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: state.user.image! != null
                                          ? NetworkImage(state.user.image!)
                                          : null,
                                      child: state.user.image! == null
                                          ? Icon(Icons.person,
                                              size: 60) // Placeholder icon
                                          : null,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VehicleDetailScreen(
                                            userModel: state.user,
                                          ),
                                        ),
                                      );
                                        },
                                        icon: Icon(Icons.arrow_forward_ios_sharp))
                                  ],
                                ),
                              ],
                            ),
                        ),
                    const vehicles_details(),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        }),
      ),
    );
  }
}
