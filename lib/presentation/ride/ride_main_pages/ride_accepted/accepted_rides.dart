// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/view_accepted_rides/accepted_rides_view_bloc.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accept/custom/notification_details.dart';

class AcceptedRidesPages extends StatefulWidget {
  const AcceptedRidesPages({super.key});

  @override
  _AcceptedRidesPagesState createState() => _AcceptedRidesPagesState();
}

class _AcceptedRidesPagesState extends State<AcceptedRidesPages> {
  @override
  void initState() {
    super.initState();
    context.read<AcceptedRidesViewBloc>().add(AcceptedUsers());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Accepted Rides'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<AcceptedRidesViewBloc, AcceptedRidesViewState>(
          builder: (context, state) {
            if (state is AcceptedUserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is AcceptedUserLoadedState) {
              return screenCodeFull(state.acceptedUsers); // Pass filtered rides
            } else if (state is AcceptedUserError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(
                  child: Text('Failed to load accepted rides.'));
            }
          },
        ),
      ),
    );
  }
}
  