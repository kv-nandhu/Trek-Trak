import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/accept/get_accepted_data/get_accepted_data_bloc.dart';
import 'package:trek_trak/presentation/ride/ride_accepted/ride_accepted.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAcceptedDataBloc>().add(GetAcceptDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(""),),
        body: BlocBuilder<GetAcceptedDataBloc, GetAcceptedDataState>(
          builder: (context, state) {
            if (state is GetAcceptedloadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is GetAcceptedloadedState) {
              final rideAccepted = state.rideAccepted.first;
              List<Map<String, String>> notifications = [
              
                {
                  'name': rideAccepted.uname!,
                  'message': 'You ride is accept',
                  'time': rideAccepted.time!,
                  'date': rideAccepted.date!,
                  'dropitlocation': rideAccepted.dropitlocation!,
                  'passengercount': rideAccepted.passengercount!,
                  'expence': rideAccepted.expence!,
                  'pickuplocation': rideAccepted.pickuplocation!,
                  'uid': rideAccepted.uid!,
                  'image': rideAccepted.image!,
                  'fromid': rideAccepted.fromuid!,
                }
              ];
              
      
              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RideAcceptedScreen(
                            time: notifications[index]['time']!,
                            date: notifications[index]['date']!,
                            dropitlocation: notifications[index]
                                ['dropitlocation']!,
                            passengercount: notifications[index]
                                ['passengercount']!,
                            expence: notifications[index]['expence']!,
                            pickuplocation: notifications[index]
                                ['pickuplocation']!,
                            uname: notifications[index]['name']!,
                            fromid: notifications[index]['fromid']!,
                            uid: notifications[index]['uid']!,
                            image: notifications[index]['image']!,
                          ),
                        ),
                      );
                    },
                    child: Dismissible(
                      key: Key(notifications[index]['name']!),
                      onDismissed: (direction) {
                        setState(() {
                          notifications.removeAt(index);
                        });
                      },
                      background: Container(color: Colors.red),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        margin:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: notifications[index]['image'] !=
                                      null
                                  ? NetworkImage(notifications[index]['image']!)
                                  : null,
                              child: notifications[index]['image'] == null
                                  ? const Icon(Icons.person, size: 60)
                                  : null,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notifications[index]['name']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(notifications[index]['message']!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No notifications available.'));
            }
          },
        ),
      ),
    );
  }
}
