import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accept/custom/first_session.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accept/custom/second_session.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accept/custom/third_session.dart';
import 'package:trek_trak/utils/color/color.dart';

class RideAcceptedScreen extends StatefulWidget {
  final String? time;
  final String? date;
  final String? dropitlocation;
  final String? passengercount;
  final String? expence;
  final String? pickuplocation;
  final String? userName;
  final String? fromid;
  final String? uid;
  final String? userImage;
  final String? requestUserId;
  final String? image;
  final String? uname;

  const RideAcceptedScreen(
      {Key? key,
      required this.time,
      required this.date,
      required this.dropitlocation,
      required this.passengercount,
      required this.expence,
      required this.pickuplocation,
      required this.userName,
      required this.fromid,
      required this.uid,
      required this.requestUserId,
      required this.userImage,
      required this.image,
      required this.uname,
      })
      : super(key: key);

  @override
  _RideAcceptedScreenState createState() => _RideAcceptedScreenState();
}

class _RideAcceptedScreenState extends State<RideAcceptedScreen> {
  late String publishingRideDetailsLink;

  @override
  Widget build(BuildContext context) {
    print("------------------------------------------------------------------------------------------------");
    print(widget.image);
    print(widget.userImage);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        FirstSessionAccept(
                          time: widget.time!,
                          pickuplocation: widget.pickuplocation!,
                          dropitlocation: widget.dropitlocation!,
                          passengercount: widget.passengercount!,
                          expence: widget.expence!,
                        ),
                        secondSessionAccept(
                            userName: widget.userName,
                            userImage: widget.userImage),
                        const Divider(),
                        const SizedBox(height: 100),
                        thirdSessionAccept(
                            uname: widget.uname,
                            userImage: widget.userImage,
                            context: context,
                            userid: widget.uid,
                            requestUserId: widget.requestUserId,
                            userName : widget.userName,
                            image : widget.image
                            )
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
  }
}
