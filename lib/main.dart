// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/bottomNavigationBar/bottom_navigation_bar_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile_build/profile_build_bloc.dart';
import 'package:trek_trak/firebase_options.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/mini_bio_repo.dart';
import 'package:trek_trak/infrastructure/repository/profile_repo/profile_repo.dart';
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
        // BlocProvider(
        //   create: (context) => BioBlocBloc(FirestoreService()),
        // ),
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