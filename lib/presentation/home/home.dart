// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "home",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  final authBoc = BlocProvider.of<AuthBloc>(context);
                  authBoc.add(LogoutEvent());
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: const Text("logout"))
          ],
        ),
      ),
    );
  }
}
