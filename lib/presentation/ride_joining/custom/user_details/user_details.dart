import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/user_indivitual/user_indivitual_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';

class ProfilePagePublishSide extends StatefulWidget {
  final UserModel userModel;

  ProfilePagePublishSide({required this.userModel, Key? key}) : super(key: key);

  @override
  State<ProfilePagePublishSide> createState() => _ProfilePagePublishSideState();
}

class _ProfilePagePublishSideState extends State<ProfilePagePublishSide> {
  bool _showPreferredChatOptions = false;
@override
  void initState() {
    super.initState();
     context.read<DataGettingBloc>().add(InduvitualPublishEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("User Profile"),
      ),
      body: BlocBuilder<UserIndivitualBloc, UserIndivitualState>(
        builder: (context, state) {
          if (state is UsesrInduvitualLoadingState) {
            return Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
              color: CustomColor.greenColor(),
              size: 100,
            ));
          } else if (state is UserInduvitualLoadState) {
            final userAge =
                state.user.dob != null ? calculateAge(state.user.dob!) : 'N/A';
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: state.user.image != null
                              ? NetworkImage(state.user.image!)
                              : null,
                          child: state.user.image == null
                              ? const Icon(Icons.person, size: 60)
                              : null,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.user.name!,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$userAge y/o",
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Experience level: Newcomer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('4.5/5 – 2 ratings', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.directions_car, color: Colors.grey),
                      const SizedBox(width: 8),
                      state.user.miniBio != "minibio" ? Text('2.5/3 ${state.user.miniBio!}'):
                        Text('2.5/3  good driver' ,
                            style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Confirmed email', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Confirmed phone number',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1),
                  const SizedBox(height: 16),
                  const Text(
                    'About Meera',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPreferredChatOptions = !_showPreferredChatOptions;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Preferred chat:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          _showPreferredChatOptions
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                      ],
                    ),
                  ),
                  if (_showPreferredChatOptions) ...[
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chat,
                        color: CustomColor.greenColor(),
                        size: 20,
                      ),
                      label: Text(state.user.chat!,
                          style: const TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 5),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.smoking_rooms_outlined,
                        color: CustomColor.greenColor(),
                        size: 20,
                      ),
                      label: Text(state.user.smoke!,
                          style: const TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 5),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.music_note,
                        color: CustomColor.greenColor(),
                        size: 20,
                      ),
                      label: Text(state.user.song!,
                          style: const TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 5),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.pets,
                        color: CustomColor.greenColor(),
                        size: 20,
                      ),
                      label:
                          Text(state.user.pet!, style: const TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 5),
                  ],
                  const SizedBox(height: 16),
                  BlocBuilder<DataGettingBloc, DataGettingState>(
                    builder: (context, state) {
                      if (state is RidePublishedSuccessState) {
                        return Text(
                          '${state.ride.length.toString()} ride published',
                          style: const TextStyle(fontSize: 16),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Member since May 2024',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Report this member',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

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

  int calculateAge(String dob) {
    DateTime today = DateTime.now();
    try {
      String formattedDob = formatDateString(dob);
      DateTime parsedDate = DateTime.parse(formattedDob);
      int age = today.year - parsedDate.year;
      if (today.month < parsedDate.month ||
          (today.month == parsedDate.month && today.day < parsedDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      print("Error parsing date: $e");
      return 0; // Return 0 or handle the error appropriately
    }
  }
}
