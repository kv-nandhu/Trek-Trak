// import 'package:flutter/material.dart';
// import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trek_trak/presentation/ride/ride_details/custom/ride_details.dart';

// class RidePage extends StatefulWidget {
//   const RidePage({super.key});

//   @override
//   State<RidePage> createState() => _RidePageState();
// }

// class _RidePageState extends State<RidePage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<DataGettingBloc>().add(InduvitualPublishEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<DataGettingBloc, DataGettingState>(
//         builder: (context, state) {
//           if (state is RidePublishLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is RidePublishedSuccessState) {
//             return buildRideList(state.ride);
//           } else {
//             return const Center(
//               child: Text('Failed to load rides'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
