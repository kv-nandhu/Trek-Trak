// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trek_trak/Application/view_accepted_rides/accepted_rides_view_bloc.dart';
// import 'package:trek_trak/domain/ride_accepteed.dart';
// import 'package:trek_trak/presentation/ride/ride_main_pages/ride_accept/ride_accept_details.dart'; // Adjust the import path as needed

// class AcceptedRidesPages extends StatefulWidget {
//   const AcceptedRidesPages({Key? key}) : super(key: key);

//   @override
//   _AcceptedRidesPagesState createState() => _AcceptedRidesPagesState();
// }

// class _AcceptedRidesPagesState extends State<AcceptedRidesPages> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<AcceptedRidesViewBloc>().add(AcceptedUsers());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Accepteds Rides'),
//           backgroundColor: Colors.green,
//         ),
//         body: BlocBuilder<AcceptedRidesViewBloc, AcceptedRidesViewState>(
//           builder: (context, state) {
//             if (state is AcceptedUserLoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.green,
//                 ),
//               );
//             } else if (state is AcceptedUserLoadedState) {
//               print(state.acceptedUsers.length);
//               print("---------------------------");
//               return screenCodeFull(state.acceptedUsers); // Pass filtered rides
//             } else if (state is AcceptedUserError) {
//               return Center(child: Text(state.message));
//             } else {
//               return const Center(
//                   child: Text('Failed to load accepted rides.'));
//             }
//           },
//         ),
//       ),
//     );
//   }

//   // Function to create the ListView for accepted rides
//   ListView screenCodeFull(List<RideAccepted> rideAccepted) {
//     return ListView.builder(
//       itemCount: rideAccepted.length,
//       itemBuilder: (context, index) {
//         final notification = rideAccepted[index];
//         return GestureDetector(
//           onTap: () {
//             final uid = notification.uid ?? '';
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => RideAcceptedScreen(
//                   time: notification.time ?? '',
//                   date: notification.date ?? '',
//                   dropitlocation: notification.dropitlocation ?? '',
//                   passengercount: notification.passengercount?.toString() ?? '',
//                   expence: notification.expence?.toString() ?? '',
//                   pickuplocation: notification.pickuplocation ?? '',
//                   userName: notification.userName ?? '',
//                   fromid: notification.fromuid ?? '',
//                   uid: uid,
//                   userImage: notification.userImage ?? '',
//                   requestUserId: notification.requestUserId,
//                   image: notification.image,
//                 ),
//               ),
//             );
//             print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//             print(notification.userImage);
//             print(notification.uname);
//           },
//           child: Container(
//             padding: const EdgeInsets.all(10.0),
//             margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: notification.image != null
//                       ? NetworkImage(notification.image!)
//                       : null,
//                   child: notification.image == null
//                       ? const Icon(Icons.person, size: 30)
//                       : null,
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         notification.uname ?? 'No name',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const Text("Your ride is accepted"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
