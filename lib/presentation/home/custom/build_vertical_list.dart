import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/presentation/ride_joining/ride_detail.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

Widget buildVerticalList(List<RidePublish> ridePublish) {
  return ListView.builder(
    shrinkWrap: true,
    physics:const NeverScrollableScrollPhysics(),
    itemCount: ridePublish.length,
    itemBuilder: (context, index) {
      final publish = ridePublish[index];
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
                        fromuid: publish.fromuid,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:backgroundColors[
                                    Random().nextInt(backgroundColors.length)],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/car_icon.png', width: 60, height: 60),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text("${publish.pickuplocation}"),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const divider_location(),
                          const SizedBox(
                            width: 6,
                          ),
                          SizedBox(
                              width: 80,
                              child: Text("${publish.dropitlocation}")),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("Seat: ${publish.passengercount}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${publish.uname}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "rate: ₹",
                            style: TextStyle(color: CustomColor.greyColor()),
                          ),
                          Text(
                            publish.expence != null &&
                                    publish.expence!.isNotEmpty
                                ? '₹${double.tryParse(publish.expence!)?.toInt() ?? 0}'
                                : '₹0',
                            style: TextStyle(color: CustomColor.redColor()),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text("${publish.time}"),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
