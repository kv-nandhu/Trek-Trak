// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/bottomNavigationBar/bottom_navigation_bar_bloc.dart';
import 'package:trek_trak/firebase_options.dart';
import 'package:trek_trak/routing/route.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp( const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(),
      initialRoute: '/',
      routes: Routers().routes
      
    )
    );
  }
}

 