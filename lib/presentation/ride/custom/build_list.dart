import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/publish_editing.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/payment/ride_payment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trek_trak/utils/color/color.dart';


Widget buildRideList(List<RidePublish> ridePublish) {
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
                    color: backgroundColors[
                                    Random().nextInt(backgroundColors.length)],
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
                              print(publish.dropitlocation);
                                print(publish.droplatitude);
    print(publish.droplongitude);
    print(publish.picklatitude);
    print(publish.picklongitude);
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
                                    droplatitude: publish.droplatitude??'s',
                                    droplongitude: publish.droplongitude??'sd',
                                    picklatitude: publish.picklatitude??'asd',
                                    picklongitude: publish.picklongitude??'WED',
                                    expence: publish.expence ?? 'sdsSA', fromuid: publish.fromuid!,
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

