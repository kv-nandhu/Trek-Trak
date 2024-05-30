import 'package:flutter/material.dart';

class RidePage extends StatelessWidget {
  const RidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Page'),
      ),
      body: const Center(
        child: Text('This is the Ride Page'),
      ),
    );
  }
}
