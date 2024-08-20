import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/publish/publish_update/ride_publish_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

class TimeEditScreen extends StatefulWidget {
  final String fromuid; // Pass the ride ID to identify the document to update

  const TimeEditScreen({super.key, required this.fromuid});

  @override
  _TimeEditScreenState createState() => _TimeEditScreenState();
}

class _TimeEditScreenState extends State<TimeEditScreen> {
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select a Time'),
          backgroundColor: CustomColor.greenColor(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Time',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Time',
                  prefixIcon: const Icon(Icons.access_time),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectTime(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Update the time and handle potential errors
            String time = _timeController.text;

            // Dispatch the event with the rideId
            BlocProvider.of<RidePublishBloc>(context).add(
              AddTimeEvent(
                time: time,
                fromuid: widget.fromuid, // Pass the ride ID here
              ),
            );

            // Show a SnackBar for feedback
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Time updated successfully!'),
              ),
            );

            Navigator.pop(context, _timeController.text);
          },
          backgroundColor: CustomColor.greenColor(),
          foregroundColor: CustomColor.whiteColor(),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
