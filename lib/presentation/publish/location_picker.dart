import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trek_trak/utils/color/color.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pick-up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/publish');
                  },
                  child: Text(
                    "Add pick-up location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greyColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Drop-it",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/dropLocation');
                  },
                  child: Text(
                    "Add Drop-it location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greyColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "select middle city",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/addCity');
                  },
                  child: Text(
                    "Add the middle city",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greyColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Select time section
                const Text(
                  "Select Time",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/timePickerPage');
                  },
                  child: Text(
                    "Add the time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greyColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Calendar section
                const Text(
                  "going date",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/calendarPage');
                  },
                  child: Text(
                    "add The going date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greyColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Passenger count",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/passengerCount');
                  },
                  child: Text(
                    "add the passenger count",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.greyColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Text(
                //   '${_selectedDay.toLocal()}'.split(' ')[0],
                //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle the submit action
            // Collect data from all controllers and selected date
            // String pickupLocation = searchController.text;
            // String dropLocation = addressController.text;
            // String selectedTime = timeController.text;
            // String selectedDate = '${_selectedDay.toLocal()}'.split(' ')[0];

            // // Process the collected data or navigate to the next screen
            // Navigator.pushNamed(context, '/summaryPage', arguments: {
            //   'pickupLocation': pickupLocation,
            //   'dropLocation': dropLocation,
            //   'selectedTime': selectedTime,
            //   'selectedDate': selectedDate,
            // });
            Navigator.pushNamed(context, '/publisConfirm');
                  
          },
          backgroundColor: CustomColor.greenColor(),
          foregroundColor: CustomColor.whiteColor(),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
