// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

const List<Color> _kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class CustomLoadingIndicator extends StatefulWidget {
  final Indicator indicator;
  final bool showPathBackground;

  const CustomLoadingIndicator({super.key, required this.indicator, this.showPathBackground = false});

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
    @override
  void initState() {
    gohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingIndicator(
          indicatorType: widget.indicator,
          colors: _kDefaultRainbowColors,
          strokeWidth: 2.0,
          pathBackgroundColor: widget.showPathBackground ? Colors.black45 : null,
        ),
      ),
    );
  }

    Future<void> gohome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/login');
  }
}
