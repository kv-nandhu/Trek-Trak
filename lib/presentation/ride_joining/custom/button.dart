import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/Application/request/user_requeset/user_request_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// UI/button.dart

class Button extends StatelessWidget {
  Button({
    super.key, 
    required this.usermodel,
    required this.time,
    required this.date,
    required this.dropitlocation,
    required this.passengercount,
    required this.expence,
    required this.pickuplocation,
  });

  final UserModel usermodel;
  final String time;
  final String date;
  final String dropitlocation;
  final String passengercount;
  final String expence;
  final String pickuplocation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: BlocBuilder<DataGettingBloc, DataGettingState>(
          builder: (context, states) {
            if (states is RidePublishedSuccessState) {
              return BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is UserProfileLoadState) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        final ride = states.ride.first;
                        BlocProvider.of<UserRequestBloc>(context).add(
                          RequestAddEvent(
                            dob: state.user.dob,
                            image: state.user.image,
                            gender: state.user.gender,
                            name: state.user.name,
                            number: state.user.number,
                            uid: usermodel.uid!,
                            fromuid: ride.fromuid!,
                            pickuplocation: pickuplocation,
                            dropitlocation: dropitlocation,
                            time: time,
                            date: date,
                            passengercount: passengercount,
                            droplatitude: ride.droplatitude.toString(), // Assuming 'droplatitude' is a double field in ride
                            droplongitude: ride.droplongitude.toString(), // Assuming 'droplongitude' is a double field in ride
                            picklatitude: ride.picklatitude.toString(), // Assuming 'picklatitude' is a double field in ride
                            picklongitude: ride.picklongitude.toString(), // Assuming 'picklongitude' is a double field in ride
                            expence: expence, requestUserId: usermodel.uid!,
                          ),
                        );
                      },
                      icon: const Icon(Icons.directions_car),
                      label: const Text('Request a ride'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: CustomColor.greenColor(),
                        minimumSize: const Size(200, 50), // Width and height
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
            } else {
              return const Center(
                child: Text('Failed to load rides'),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Ride Details'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }
}
