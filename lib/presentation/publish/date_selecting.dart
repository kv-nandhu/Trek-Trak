import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
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
            // Navigate to the next screen
            Navigator.pushNamed(context, '/locationPickerPage');
          },
          backgroundColor: CustomColor.greenColor(), // Set the background color
          foregroundColor: CustomColor.whiteColor(), // Set the icon color
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}


