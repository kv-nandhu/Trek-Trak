import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/user_indivitual/user_indivitual_bloc.dart';
import 'package:trek_trak/presentation/ride_joining/custom/button.dart';
import 'package:trek_trak/presentation/ride_joining/custom/first_session.dart';
import 'package:trek_trak/presentation/ride_joining/custom/second_session.dart';
import 'package:trek_trak/presentation/ride_joining/custom/third_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PublishingRideDetails extends StatefulWidget {
  final String? time;
  final String? date;
  final String? dropitlocation;
  final String? passengercount;
  final String? expence;
  final String? pickuplocation;
  final String? uname;
  final String? fromuid;
  final String? uid;

  PublishingRideDetails(
      {Key? key,
      required this.time,
      required this.date,
      required this.dropitlocation,
      required this.passengercount,
      required this.expence,
      required this.pickuplocation,
      required this.uname,
      required this.fromuid,
      required this.uid})
      : super(key: key);

  @override
  _PublishingRideDetailsState createState() => _PublishingRideDetailsState();
}

class _PublishingRideDetailsState extends State<PublishingRideDetails> {
  late String publishingRideDetailsLink;

  @override
  void initState() {
    super.initState();
    context.read<UserIndivitualBloc>().add(UserUidEvent(uid: widget.uid!));
    publishingRideDetailsLink = 'https://example.com/details_page';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<UserIndivitualBloc, UserIndivitualState>(
        builder: (context, state) {
          if (state is UsesrInduvitualLoadingState) {
            return Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
              color: CustomColor.greenColor(),
              size: 100,
            ));
          } else if (state is UserInduvitualLoadState) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          FirstSession(
                            time: widget.time!,
                            date: widget.date!,
                            dropitlocation: widget.dropitlocation!,
                            passengercount: widget.passengercount!,
                            expence: widget.expence!,
                            pickuplocation: widget.pickuplocation!,
                          ),
                          secondSession(
                              usermodel: state.user, context: context),
                          const Divider(),
                          thirdSession(
                            detailsPageLink: publishingRideDetailsLink,
                            time: widget.time!,
                            date: widget.date!,
                            dropitlocation: widget.dropitlocation!,
                            passengercount: widget.passengercount!,
                            expence: widget.expence!,
                            pickuplocation: widget.pickuplocation!,
                            usermodel: state.user,
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ],
                  ),
                ),
                Button(
                  usermodel: state.user,
                  time: widget.time!,
                  date: widget.date!,
                  dropitlocation: widget.dropitlocation!,
                  passengercount: widget.passengercount!,
                  expence: widget.expence!,
                  pickuplocation: widget.pickuplocation!,
                  fromuid: widget.fromuid!,
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
