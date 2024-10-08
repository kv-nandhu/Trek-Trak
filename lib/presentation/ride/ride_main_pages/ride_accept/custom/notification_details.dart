import 'package:flutter/material.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';

import '../ride_accept_details.dart';

ListView screenCodeFull(List<RideAccepted> rideAccepted) {
    return ListView.builder(
            itemCount: rideAccepted.length,
          itemBuilder: (context, index) {
              final notification = rideAccepted[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RideAcceptedScreen(
                        time: notification.time ?? '',
                        date: notification.date ?? '',
                        dropitlocation: notification.dropitlocation ?? '',
                        passengercount:
                            notification.passengercount?.toString() ?? '',
                        expence: notification.expence?.toString() ?? '',
                        pickuplocation: notification.pickuplocation ?? '',
                        userName: notification.userName ?? '',
                        fromid: notification.fromuid ?? '',
                        uid:notification.uid,
                        requestUserId : notification.requestUserId,
                        userImage: notification.userImage ?? '', 
                        image: notification.image,
                        uname: notification.uname
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: notification.image != null
                            ? NetworkImage(notification.image!)
                            : null,
                        child: notification.image == null
                            ? const Icon(Icons.person, size: 30)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.userName ?? 'No name',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Text("your ride is accepted"),
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
