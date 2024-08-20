import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trek_trak/domain/publish_model.dart';
import 'package:trek_trak/presentation/ride_joining/ride_detail.dart';
import 'package:trek_trak/utils/color/color.dart';

class RideCardCarousel extends StatefulWidget {
  final List<RidePublish> ridePublish;

  RideCardCarousel({required this.ridePublish});

  @override
  _RideCardCarouselState createState() => _RideCardCarouselState();
}

class _RideCardCarouselState extends State<RideCardCarousel> {
  late ScrollController _scrollController;
  late Timer _autoScrollTimer;
  double _scrollPosition = 0.0;
  final double _scrollSpeed = 100.0; // Adjust speed as needed

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _autoScrollTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _scrollPosition += _scrollSpeed;

      if (_scrollController.hasClients) {
        if (_scrollController.position.maxScrollExtent > _scrollPosition) {
          _scrollController.animateTo(
            _scrollPosition,
            duration: Duration(seconds: 1),
            curve: Curves.linear,
          );
        } else {
          // If reached the end, reset to the beginning
          _scrollPosition = 50;
          _scrollController.animateTo(
            _scrollPosition,
            duration: Duration(seconds: 5),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uniqueFromuids = <String, RidePublish>{};

    for (var publish in widget.ridePublish) {
      if (publish.fromuid != null) {
        // Add to map if not already present
        uniqueFromuids.putIfAbsent(publish.fromuid!, () => publish);
      }
    }

    final uniqueRidePublishList = uniqueFromuids.values.toList();

    print('Unique RidePublish List:');
    for (var publish in uniqueRidePublishList) {
      print('FromUID: ${publish.fromuid}, UID: ${publish.uid}');
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: uniqueRidePublishList.map((publish) {
          return InkWell(
            onTap: () {
              print('Navigating to details with fromuid: ${publish.fromuid}');
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
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                height: 250,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color:backgroundColors[
                                    Random().nextInt(backgroundColors.length)],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 99, 99, 99).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
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
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
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
                                ),
                              ),
                              const Spacer(),
                              Text(
                                publish.expence != null && publish.expence!.isNotEmpty
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
            ),
          );
        }).toList(),
      ),
    );
  }
}
