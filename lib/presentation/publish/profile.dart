import 'package:flutter/material.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish Page'),
      ),
      body: const Center(
        child: Text('This is the Publish Page'),
      ),
    );
  }
}
