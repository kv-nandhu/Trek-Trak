import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/Application/request/user_requeset/user_request_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// UI/button.dart

class Button extends StatefulWidget {
  Button({
    super.key,
    required this.usermodel,
    required this.time,
    required this.date,
    required this.dropitlocation,
    required this.passengercount,
    required this.expence,
    required this.pickuplocation,
    required this.fromuid,
  });

  final UserModel usermodel;
  final String time;
  final String date;
  final String dropitlocation;
  final String passengercount;
  final String expence;
  final String pickuplocation;
  final String fromuid;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _hasRequested = false; // Track if the user has made a request

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
                    // Check if the current user is the same as the ride creator
                    if (widget.usermodel.uid == state.user.uid) {
                      return const SizedBox(); // Hide the button if the user is the same
                    }

                    return ElevatedButton.icon(
                      onPressed: _hasRequested
                          ? null // Disable the button if request has been made
                          : () {
                              final ride = states.ride.first;
                              BlocProvider.of<UserRequestBloc>(context).add(
                                RequestAddEvent(
                                  dob: state.user.dob,
                                  image: state.user.image,
                                  gender: state.user.gender,
                                  name: state.user.name,
                                  number: state.user.number,
                                  uid: widget.usermodel.uid!,
                                  fromuid: widget.fromuid,
                                  pickuplocation: widget.pickuplocation,
                                  dropitlocation: widget.dropitlocation,
                                  time: widget.time,
                                  date: widget.date,
                                  passengercount: widget.passengercount,
                                  droplatitude: ride.droplatitude.toString(),
                                  droplongitude: ride.droplongitude.toString(),
                                  picklatitude: ride.picklatitude.toString(),
                                  picklongitude: ride.picklongitude.toString(),
                                  expence: widget.expence,
                                  requestUserId: widget.usermodel.uid!,
                                ),
                              );

                              setState(() {
                                _hasRequested = true; // Update state to indicate request made
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Your request was successful!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                      icon: const Icon(Icons.directions_car),
                      label: Text(_hasRequested ? 'Request Sent' : 'Request a ride'),
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
