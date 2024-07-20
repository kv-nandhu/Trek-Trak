import 'package:flutter/material.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/presentation/ride_joining/ride_detail.dart';
import 'package:trek_trak/utils/color/color.dart';

Widget buildRideCard(List<RidePublish> ridePublish, BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: ridePublish.map((publish) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublishingRideDetails(
                          uname: publish.uname,
                          time: publish.time,
                          date: publish.date,
                          dropitlocation: publish.dropitlocation,
                          passengercount: publish.passengercount,
                          expence: publish.expence,
                          pickuplocation: publish.pickuplocation,
                           uid: publish.uid,
                           fromid: publish.fromuid,
                        )));
          },
          child: Container(
            width: 200,
            height: 250,
            margin: const EdgeInsets.only(right: 16),
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
                      Text("To: ${publish.dropitlocation ?? 'malapuram'}"),
                      const Divider(height: 20, thickness: 1),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8),
                          SizedBox(
                              width: 80,
                              child: Text(
                                "${publish.uname}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          Text(
                            publish.expence != null &&
                                    publish.expence!.isNotEmpty
                                ? '₹${double.tryParse(publish.expence!)?.toInt() ?? 0}'
                                : '₹0',
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
      }).toList(),
    ),
  );
}
