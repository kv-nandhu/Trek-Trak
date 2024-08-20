import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/presentation/home/custom/build_ride_card.dart';
import 'package:trek_trak/presentation/home/custom/build_vertical_list.dart';
import 'package:trek_trak/presentation/home/custom/ride_alert.dart';
import 'package:trek_trak/presentation/home/custom/search.dart';
import 'package:trek_trak/presentation/home/custom/shimer.dart';
import 'package:trek_trak/presentation/home/custom/title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DataGettingBloc>().add(GetRidePublishEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const title(),
      ),
      body: BlocBuilder<DataGettingBloc, DataGettingState>(
        builder: (context, state) {
          if (state is RidePublishLoadingState) {
            return const CurrentUserShimmerEffect();
          } else if (state is RidePublishErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is RidePublishedSuccessState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SearchField(),
                  const SizedBox(height: 16),
                  const MovingToday(),
                  RideCardCarousel(ridePublish: state.ride,),
                  const SizedBox(height: 32),
                  buildVerticalList(state.ride),
                ],
              ),
            );
          } else {
            return const RideAlert();
          }
        },
      ),
    );
  }
}
