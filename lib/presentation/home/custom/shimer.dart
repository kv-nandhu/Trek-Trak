import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

class CurrentUserShimmerEffect extends StatelessWidget {
  const CurrentUserShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RidePublish> ridePublishList = List.generate(
        5,
        (index) => RidePublish(
              time: "12:00 PM",
              pickuplocation: "Pickup Location $index",
              dropitlocation: "Drop Location $index",
              expence: 50.0,
            ));

    return ListView.builder(
      itemCount: ridePublishList.length,
      itemBuilder: (context, index) {
        final RidePublish publish = ridePublishList[index];

        return Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 136, 134, 134),
          highlightColor: const Color.fromARGB(255, 255, 255, 255),
          child: Container(
            width: double.infinity,
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/car_icon.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Depart At ${publish.time}"),
                      const SizedBox(height: 8),
                      Text("From: ${publish.pickuplocation}"),
                      const SizedBox(height: 8),
                      Text("To: ${publish.dropitlocation ?? 'Malapuram'}"),
                      const Divider(height: 20, thickness: 1),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8),
                          Text(
                            "Farhan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '₹${publish.expence}',
                            style: TextStyle(color: CustomColor.redColor()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RidePublish {
  final String time;
  final String pickuplocation;
  final String? dropitlocation;
  final double expence;

  RidePublish({
    required this.time,
    required this.pickuplocation,
    this.dropitlocation,
    required this.expence,
  });
}
