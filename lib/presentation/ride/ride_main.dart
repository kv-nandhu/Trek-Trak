import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/ride/request_page.dart';
import 'package:trek_trak/presentation/ride/ride_details/ride.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/Accepted_home_Page.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/ride_accepted.dart';
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.whiteColor(),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Ride Details')),
              Tab(child: Text('Ride Requests')),
              Tab(child: Text('Ride Accepted')),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // RidePage(),
            RequestItem(),
            AcceptedHomePage(),
          ],
        ),
      ),
    );
  }
}
