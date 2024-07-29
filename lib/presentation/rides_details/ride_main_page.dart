import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/publish_editing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/presentation/ride/request_page.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/Accepted_home_Page.dart';
import 'package:trek_trak/presentation/rides_details/accepted_rides.dart';
import 'package:trek_trak/presentation/rides_details/payment_screen.dart';
import 'package:trek_trak/presentation/rides_details/ride_payment.dart';



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
        // appBar: AppBar(
        //   title: const Text('Ride Details'),
        // ),
        body: Column(
          children: [
            // Heading
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Ride Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Horizontally scrollable row with navigation
            SizedBox(
              height: 100, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildNavContainer(context, 'Ride Request', const RequestItem()),
                  _buildNavContainer(context, 'Ride Accept', const AcceptedHomePage()),
                  _buildNavContainer(context, 'Accepted Rides',const AcceptedRidesPages()),
                  _buildNavContainer(context, 'Payments', PaymentPage()),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Your Rides ↓",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
              const SizedBox(height: 10,),
            // Vertical list view
            Expanded(
              child: BlocBuilder<DataGettingBloc, DataGettingState>(
                builder: (context, state) {
                  if (state is RidePublishLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RidePublishedSuccessState) {
                    return _buildRideList(state.ride);
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
Widget _buildNavContainer(BuildContext context, String text, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Inner color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(
          color: Colors.green, // Border color
          width: 2, // Border width
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
        ),
      ),
    ),
  );
}


  Widget _buildRideList(List<RidePublish> ridePublish) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: ridePublish.length,
        itemBuilder: (context, index) {
          final publish = ridePublish[index];
          final rideAccepted = RideAccepted();
          print(rideAccepted);
          return 
          Column(
            children: [
              InkWell(
                onTap: () {
                    print(rideAccepted);
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RidePaymentDetails(acceptid: publish.fromuid!, rideAccepted: rideAccepted,), // Pass the ride ID
                  ),
                );
                  
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Depart At: ${publish.time}"),
                      const SizedBox(height: 8),
                      Text("Rate: \$${publish.expence}"),
                      const SizedBox(height: 8),
                      Text("From: ${publish.pickuplocation}"),
                      const SizedBox(height: 8),
                      Text("To: ${publish.dropitlocation}"),
                      const SizedBox(height: 8),
                      Text("Passenger Count: ${publish.passengercount}"),
                      const SizedBox(height: 8),
                      const Divider(height: 20, thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PublishEditing(
                                    pickuplocation: publish.pickuplocation!,
                                    dropitlocation: publish.dropitlocation ?? 'fsddsoh',
                                    middlecity: 'add middle city',
                                    time: publish.time ?? 'sdds',
                                    date: publish.date ?? 'sdfdsa',
                                    passengercount: publish.passengercount ?? 'sdasd',
                                    droplatitude: publish.droplatitude ?? 'sda',
                                    droplongitude: publish.droplongitude ?? 'as',
                                    picklatitude: publish.picklatitude ?? 'SCSc',
                                    picklongitude: publish.picklongitude ?? 'sdC',
                                    expence: publish.expence ?? 'sdsSA',
                                  ),
                                ),
                              );
                            },
                            child: const Text('Edit'),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              showDailoges(context, "You want to delete the ride", publish.fromuid!);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showDailoges(BuildContext context, String content, String uids) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("publish").doc(uids).delete();
                context.read<DataGettingBloc>().add(InduvitualPublishEvent());
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
