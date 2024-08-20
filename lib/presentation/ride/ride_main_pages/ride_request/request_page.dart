import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/request/get_request_ride/get_request_ride_data_bloc.dart';
import 'package:trek_trak/Application/accept/ride_accept/ride_accept_bloc.dart';
import 'package:trek_trak/domain/request_data.dart';
import 'package:trek_trak/presentation/ride/ride_main_pages/ride_request/requester_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestItem extends StatefulWidget {
  const RequestItem({super.key});

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem> {
  @override
  void initState() {
    super.initState();
    context.read<GetRequestRideDataBloc>().add(FetchRequestRideDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Requests'),
      ),
      body: BlocBuilder<GetRequestRideDataBloc, GetRequestRideDataState>(
        builder: (context, state) {
          if (state is GetRequestRideDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetRequestRideSuccess) {
            return _buildRequestItem(state.requestList);
          } else if (state is GetRequestRideError) {
            return Center(child: Text('${state.error}'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  Widget _buildRequestItem(List<UserRequest> requests) {
    if (requests.isEmpty) {
      return const Center(child: Text('No requests found'));
    }

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        UserRequest request = requests[index];

        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: request.image != null
                        ? NetworkImage(request.image!)
                        : null,
                    child: request.image == null
                        ? const Icon(Icons.person, size: 60)
                        : null,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      request.name ?? 'Unknown',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequesterProfile(
                                      name: request.name,
                                      image: request.image,
                                      gender: request.gender,
                                      dob: request.dob,
                                      number: request.number,
                                    )));
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _handleAcceptRequest(request);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _handleDeclineRequest(request);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: InkWell(
                      onTap: () {
                        showDailoges(context, "You want to delete the ride?", request.request_id!);
                      },
                      child: const Text('Decline'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleAcceptRequest(UserRequest request) {
    // Add logic to accept the request
    context.read<RideAcceptBloc>().add(
      RideAcceptAddEvent(
        uname: request.name ?? 'Unknown',
        pickuplocation: request.pickuplocation!,
        dropitlocation: request.dropitlocation!,
        time: request.time!,
        date: request.date!,
        passengercount: request.passengercount!,
        expence: request.expence.toString(),
        fromuid: request.fromuid!,
        requestUserId: request.requestUserId!,
        image: request.image ?? "", // Handle null image case
      ),
    );

    // Optionally show a notification or update the UI
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Request accepted successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Refresh the request list
    context.read<GetRequestRideDataBloc>().add(FetchRequestRideDataEvent());
  }

  void _handleDeclineRequest(UserRequest request) {
    // Add logic to decline the request
    showDailoges(context, "Are you sure you want to decline this request?", request.request_id!);
  }

  void showDailoges(BuildContext context, String content, String requestid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("user_request")
                    .doc(requestid)
                    .delete();
                context.read<GetRequestRideDataBloc>().add(FetchRequestRideDataEvent());
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
}
