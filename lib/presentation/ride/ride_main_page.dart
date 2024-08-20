import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/presentation/ride/custom/build_list.dart';
import 'package:trek_trak/presentation/ride/custom/custom.dart';

class RidePage extends StatefulWidget {
  const RidePage({Key? key}) : super(key: key);

  @override
  State<RidePage> createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  @override
  void initState() {
    super.initState();
    context.read<DataGettingBloc>().add(InduvitualPublishEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const RideDetailsText(),
            const BuildNavContainer(),
            const SizedBox(height: 10),
            const TourRideText(),
            const SizedBox( height: 10),
            Expanded(
              child: BlocBuilder<DataGettingBloc, DataGettingState>(
                builder: (context, state) {
                  if (state is RidePublishLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RidePublishedSuccessState) {
                    return buildRideList(state.ride);
                  } else {
                    return const Center(
                      child: Text('Failed to load rides'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

