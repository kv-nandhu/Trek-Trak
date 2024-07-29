import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/accept/get_accepted_data/get_accepted_data_bloc.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/ride_accepted.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    // Fetch accepted rides data
    context.read<GetAcceptedDataBloc>().add(GetAcceptDataEvent());
  }

  void _markNotificationAsRead(String uid) {
    // Mark notification as read in the BLoC
    context.read<GetAcceptedDataBloc>().add(MarkNotificationsAsReadEvent(uid));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: BlocBuilder<GetAcceptedDataBloc, GetAcceptedDataState>(
          builder: (context, state) {
            if (state is GetAcceptedloadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAcceptedloadedState) {
              final rideAccepted = state.rideAccepted;

              if (rideAccepted.isEmpty) {
                return const Center(child: Text('No notifications available.'));
              }

              return ListView.builder(
                itemCount: rideAccepted.length,
                itemBuilder: (context, index) {
                  final notification = rideAccepted[index];
                  return GestureDetector(
                    onTap: () {
                      // Safely handle null checks
                      final uid = notification.uid ?? '';
                      if (uid.isNotEmpty) {
                        _markNotificationAsRead(uid);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RideAcceptedScreen(
                              time: notification.time ?? '',
                              date: notification.date ?? '',
                              dropitlocation: notification.dropitlocation ?? '',
                              passengercount: notification.passengercount?.toString() ?? '',
                              expence: notification.expence?.toString() ?? '',
                              pickuplocation: notification.pickuplocation ?? '',
                              uname: notification.uname ?? '',
                              fromid: notification.fromuid ?? '',
                              uid: uid,
                              image: notification.image ?? '',
                            ),
                          ),
                        );
                      }
                    },
                    child: Dismissible(
                      key: Key(notification.uid ?? ''),
                      onDismissed: (direction) {
                        // Update the state to remove the dismissed notification
                        setState(() {
                          rideAccepted.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        elevation: 4,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: notification.image != null
                                ? NetworkImage(notification.image!)
                                : null,
                            child: notification.image == null
                                ? const Icon(Icons.person, size: 30)
                                : null,
                          ),
                          title: Text(
                            notification.uname ?? 'No name',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.time ?? 'No time'),
                              Text(notification.date ?? 'No date'),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No notifications available.'));
            }
          },
        ),
      ),
    );
  }
}
