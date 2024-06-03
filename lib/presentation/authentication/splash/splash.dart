// ignore_for_file: file_names, use_build_context_synchronously, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(CheckLoginStatusEvent());
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/first');
            });
          } else if (state is Authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/mybottom');
            });
          }
        },
        child: Scaffold(
          backgroundColor: CustomColor.greenColor(),
          body: Center(
            child: SizedBox(
              width: 1200,
              height: 1200,
              child: Image.asset(
                'images/splash.png',
                fit: BoxFit
                    .cover, // You can change this to any other BoxFit value based on your needs
              ),
            ),
          ),
        ));
  }
}
