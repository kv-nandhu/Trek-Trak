import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/get_request_ride/get_request_ride_data_bloc.dart';
import 'package:trek_trak/presentation/ride/request_page.dart';
import 'package:trek_trak/presentation/ride/ride.dart';
import 'package:trek_trak/utils/color/color.dart';

class RideMainPage extends StatefulWidget {
  const RideMainPage({super.key});

  @override
  State<RideMainPage> createState() => _RideMainPageState();
}

class _RideMainPageState extends State<RideMainPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.whiteColor(),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Ride Details')),
              Tab(child: Text('Ride Requests')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RidePage(),
            BlocBuilder<GetRequestRideDataBloc, GetRequestRideDataState>(
              builder: (context, state) {
                if (state is GetRequestRideDataLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetRequestRideSuccess) {
                  // Pass the fromuid to RequestItem
                  print(state.requestList.first.uid!);
                  return RequestItem(uid: state.requestList.first.uid!);
                } else if (state is GetRequestRideError) {
                
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return  const Center( child: CircularProgressIndicator.adaptive(),);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
