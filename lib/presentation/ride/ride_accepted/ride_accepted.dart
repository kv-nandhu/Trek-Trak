import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/custom/first_session.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/custom/second_session.dart';
import 'package:trek_trak/utils/color/color.dart';

class RideAcceptedScreen extends StatefulWidget {
  final String? time;
  final String? date;
  final String? dropitlocation;
  final String? passengercount;
  final String? expence;
  final String? pickuplocation;
  final String? uname;
  final String? fromid;
  final String? uid;
  final String? image;

  const RideAcceptedScreen(
      {Key? key,
      required this.time,
      required this.date,
      required this.dropitlocation,
      required this.passengercount,
      required this.expence,
      required this.pickuplocation,
      required this.uname,
      required this.fromid,
      required this.uid,
      required this.image})
      : super(key: key);

  @override
  _RideAcceptedScreenState createState() => _RideAcceptedScreenState();
}

class _RideAcceptedScreenState extends State<RideAcceptedScreen> {
  late String publishingRideDetailsLink;

  @override
  Widget build(BuildContext context) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/mybottom');
                          },
                          label: Text(
                            "Back",
                            style: TextStyle(
                              color: CustomColor.greenColor(),
                              fontSize: 20,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: CustomColor.greenColor(),
                          ),
                        ),
                      ],
                    ),
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
                            uname: widget.uname, image: widget.image),
                        const Divider(),
                        const SizedBox(height: 100),
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
