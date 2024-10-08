// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/update_pic/update_pic_bloc.dart';
import 'package:trek_trak/Application/About_bloc/user_indivitual/user_indivitual_bloc.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/accept/get_accepted_data/get_accepted_data_bloc.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/Application/bottomNavigationBar/bottom_navigation_bar_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/Application/chats/bloc/chat_room_bloc.dart';
import 'package:trek_trak/Application/chats/chat/chat_bloc.dart';
import 'package:trek_trak/Application/chats/fetchchat/chat_list_bloc.dart';
import 'package:trek_trak/Application/payment/get_payment/get_payment_bloc.dart';
import 'package:trek_trak/Application/payment/payment_request/payment_request_bloc.dart';
import 'package:trek_trak/Application/request/get_request_ride/get_request_ride_data_bloc.dart';
import 'package:trek_trak/Application/publish/google_maps/google_map_bloc.dart';
import 'package:trek_trak/Application/publish/publish_add/publish_add_bloc.dart';
import 'package:trek_trak/Application/publish/publish_update/ride_publish_bloc.dart';
import 'package:trek_trak/Application/accept/ride_accept/ride_accept_bloc.dart';
import 'package:trek_trak/Application/request/user_requeset/user_request_bloc.dart';
import 'package:trek_trak/Application/view_accepted_rides/accepted_rides_view_bloc.dart';
import 'package:trek_trak/firebase_options.dart';
import 'package:trek_trak/infrastructure/chat/chat.dart';
import 'package:trek_trak/infrastructure/repository/payment/payment_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/image_update.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_add.dart';
import 'package:trek_trak/infrastructure/repository/publish/publish_repo.dart';
import 'package:trek_trak/infrastructure/repository/publish/search_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/mini_bio_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/data_get.dart';
import 'package:trek_trak/infrastructure/repository/ride_accept/ride_accept.dart';
import 'package:trek_trak/infrastructure/repository/user_request/user_request_add.dart';
import 'package:trek_trak/routing/route.dart';
// Import your FirestoreService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirestoreService firestoreService = FirestoreService(); // Initialize FirestoreService

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final FirestoreService firestoreService;

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBarBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(UserProfileRepo())..add(GetUserEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBuildBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleMapBloc(SearchRepo()),
        ),
        BlocProvider(
          create: (context) => RidePublishBloc(UserProfileRepo(), RidePublishService())),
   
        BlocProvider(
          create: (context) => PublishAddBloc(RidePublishAddingService())),
        BlocProvider(
          create: (context) => DataGettingBloc()),
        BlocProvider(
          create: (context) => UserIndivitualBloc()),
        BlocProvider(
          create: (context) => UserRequestBloc(RideRequestingService())),
   
        BlocProvider(
          create: (context) => GetRequestRideDataBloc(UserProfileRepo())),
        BlocProvider(
          create: (context) => RideAcceptBloc(RideAcceptService())),
   
        BlocProvider(
          create: (context) => GetAcceptedDataBloc(UserProfileRepo())),
   
        BlocProvider(
          create: (context) => AcceptedRidesViewBloc(UserProfileRepo())),
   
        BlocProvider(
          create: (context) => PaymentRequestBloc(PaymentRequesting())),
        BlocProvider(
          create: (context) => GetPaymentBloc(UserProfileRepo())),
        BlocProvider(
          create: (context) => ChatRoomBloc(MessageRepo())),
        BlocProvider(
          create: (context) => UpdatePicBloc(ImageRepo())),
   
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.fallback(),
        initialRoute: '/',
        routes: Routers().routes,
     
      ),
    );
  }
}



























































































































































































































































// ignore_for_file: prefer_const_constructors

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_container.dart';
// import 'package:shimmer/shimmer.dart';

// class HomeShimmer extends StatefulWidget {
//   const HomeShimmer({super.key});

//   @override
//   State<HomeShimmer> createState() => _HomeShimmerState();
// }

// class _HomeShimmerState extends State<HomeShimmer> {
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: Color.fromARGB(255, 136, 134, 134),
//         highlightColor: Color.fromARGB(255, 255, 255, 255),
//         child: SizedBox(
//             height: 1000,
//             child: ListView.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(children: [
//                         ListTile(
//                           leading: CircleAvatar(),
//                           title: Padding(
//                             padding: const EdgeInsets.only(right: 100),
//                             // child: ShimmerTextHelper(
//                             //   length: 20,
//                             //   width: double.infinity,
//                             // ),
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 30, right: 30, top: 8, bottom: 8),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.white),
//                               height: 350,
//                             )),
//                         SizedBox(
//                           height: 20,
//                           width: 10,
//                         ),
//                         Row(children: const [
//                           Icon(Icons.favorite),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Icon(CupertinoIcons.chat_bubble_text),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           // ShimmerTextHelper(
//                           //   length: 20,
//                           //   width: 150,
//                           // ),
//                         ]),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 60, right: 60),
//                           child: Divider(
//                             thickness: 2,
//                           ),
//                         )
//                       ]));
//                 })));
//   }
// }