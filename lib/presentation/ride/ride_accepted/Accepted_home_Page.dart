import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/accept/get_accepted_data/get_accepted_data_bloc.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/presentation/home/custom/title.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/custom/notification_details.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/ride_accepted.dart';

class AcceptedHomePage extends StatefulWidget {
  const AcceptedHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _AcceptedHomePageState createState() => _AcceptedHomePageState();
}

class _AcceptedHomePageState extends State<AcceptedHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAcceptedDataBloc>().add(GetAcceptDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Ride Accepts"),),
        body: BlocBuilder<GetAcceptedDataBloc, GetAcceptedDataState>(
          builder: (context, state) {
            if (state is GetAcceptedloadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is GetAcceptedloadedState) {
              final rideAccepted = state.rideAccepted;
              return screenCodeFull(rideAccepted);
            } else {
              return const Center(child: Text('No notifications available.'));
            }
          },
        ),
      ),
    );
  }

  }
