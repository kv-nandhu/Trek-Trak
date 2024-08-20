import 'package:flutter/cupertino.dart';
import 'package:trek_trak/presentation/ride/custom/build_container.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/payment/payment_screen.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accept/Accepted_home_Page.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accepted/accepted_rides.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_request/request_page.dart';

class TourRideText extends StatelessWidget {
  const TourRideText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Your Rides ↓",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class BuildNavContainer extends StatelessWidget {
  const BuildNavContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Adjust height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildNavContainer(
              context, 'Ride Request', const RequestItem()),
          buildNavContainer(
              context, 'Ride Accept', const AcceptedHomePage()),
          buildNavContainer(
              context, 'Accepted Rides', const AcceptedRidesPages()),
          buildNavContainer(context, 'Payments', PaymentPage()),
        ],
      ),
    );
  }
}

class RideDetailsText extends StatelessWidget {
  const RideDetailsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Text(
        "Ride Details",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
