// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(CheckLoginStatusEvent());
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/first');
            });
          } else if (state is UnAuthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/login');
            });
          }
        },
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 7, 211, 28),
          body: Center(
            child: Container(
              width: 1200,
              height: 1200,
              child: Image.asset(
                'images/Trek.gif',
                fit: BoxFit
                    .cover, // You can change this to any other BoxFit value based on your needs
              ),
            ),
          ),
        ));
  }
  //   Future<void> gotohome(BuildContext context) async {
  //   await Future.delayed(const Duration(seconds: 3));

  // }
}
