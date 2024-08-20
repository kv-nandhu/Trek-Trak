import 'package:flutter/material.dart';

class RideAlert extends StatelessWidget {
  const RideAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No rides found for the selected date.',
              style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => handleRideAlert(context),
                child: const Text('Ride Alert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void handleRideAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Your Ride Alert is created successfully')),
    );
  }
}
