import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/profile_widget.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/vehicle_custom.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/verifying_custom.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/preferneceItems.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/vehiclc_dtls_custom.dart';
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
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserProfileLoadState) {
            // if (state.user.smoke == 'smokes') {
            //   smokeisTrue = false;
            // } else {
            //   smokeisTrue = true;
            // }
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
                    const IdVerifying(),
                    //!--------------email_verifying--------
                    EmailVerifying(state: state),
                    //!-------------- number_verifying------
                    NumberVerifying(state: state),
                    const divider_thickness_big(),
                    const Text(
                      "About you",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!-------------- mini_bio--------------
                    MiniBio(bio: state.user.miniBio ?? 'No data'),
                    //!-------------- add_preferences-------

                    if (state.user.chat != 'chattiness')
                      PreferenceItem(
                        icon: Icons.message,
                        text: state.user.chat!,
                      ),
                    if (state.user.song != 'songs')
                      PreferenceItem(
                        icon: Icons.music_note,
                        text: state.user.song ?? "add the music preference",
                      ),
                    if (state.user.smoke != 'smokes')
                      PreferenceItem(
                        icon: Icons.smoking_rooms_rounded,
                        text: state.user.smoke ?? "add the smoke preference",
                      ),
                    if (state.user.pet != 'pets')
                      PreferenceItem(
                        icon: Icons.pets,
                        text: state.user.pet ?? "add the pet preference",
                      ),
                    AddPreferences(
                      chatiness: state.user.chat,
                      songs: state.user.song,
                      smokes: state.user.smoke,
                      pets: state.user.pet,
                    ),
                    const divider_normal(),
                    const Text(
                      "Vehicles",
                      style: TextStyle(fontSize: 20),
                    ),
                    //!-------------- vehicles_details-----
                    if (state.user.vcolor != 'vehicle color')
                      VehicleDetails(userModel: state.user),
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
