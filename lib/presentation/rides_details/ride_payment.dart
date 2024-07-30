import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_button/slider_button.dart';
import 'package:trek_trak/Application/payment/payment_request/payment_request_bloc.dart';
import 'package:trek_trak/Application/view_accepted_rides/accepted_rides_view_bloc.dart';
import 'package:trek_trak/domain/ride_accepteed.dart';
import 'package:trek_trak/presentation/home/custom/title.dart';
import 'package:trek_trak/utils/color/color.dart';

class RidePaymentDetails extends StatefulWidget {
  final String acceptid;
  final RideAccepted rideAccepted;

  const RidePaymentDetails({
    Key? key,
    required this.acceptid,
    required this.rideAccepted,
  }) : super(key: key);

  @override
  State<RidePaymentDetails> createState() => _RidePaymentDetailsState();
}

class _RidePaymentDetailsState extends State<RidePaymentDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<AcceptedRidesViewBloc>()
        .add(FetchAcceptedUsersEvent(widget.acceptid));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.rideAccepted);
    print("---------------------------------------------");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepted Users'),
      ),
      body: BlocBuilder<AcceptedRidesViewBloc, AcceptedRidesViewState>(
        builder: (context, state) {
          if (state is RidePaymentLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RidePaymentErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is RidePaymentSuccessState) {
            final acceptedUsers = state.acceptedUsers;
            return ListView.builder(
              itemCount: acceptedUsers.length,
              itemBuilder: (context, index) {
                final user = acceptedUsers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                state.acceptedUsers[index].image != null
                                    ? NetworkImage(
                                        "${state.acceptedUsers[index].image}")
                                    : null,
                            child: state.acceptedUsers[index].image == null
                                ? Icon(Icons.person, size: 60)
                                : null,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Text(
                              state.acceptedUsers[index].uname ?? 'Unknown',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(8.0),
                          child: SliderButton(
                            action: () async {
                              BlocProvider.of<PaymentRequestBloc>(context).add(
                                PaymentAddEvent(
                                    name: acceptedUsers[index].uname,
                                    rideUserId: acceptedUsers[index].uid,
                                    rideUserName: acceptedUsers[index].userName,
                                    userId: acceptedUsers[index].requestUserId,
                                    expence: acceptedUsers[index].expence),
                              );
                              return Future.delayed(Duration(seconds: 2));
                            },
                            label: const Text(
                              'Reached',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color.fromARGB(255, 173, 9, 9),
                              ),
                            ),
                            boxShadow: BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 9,
                              offset: const Offset(2, 5),
                            ),
                            radius: 50,
                            width: double.infinity,
                            backgroundColor: CustomColor.greenColor(),
                            highlightedColor: CustomColor.redColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No accepted users'));
        },
      ),
    );
  }
}
