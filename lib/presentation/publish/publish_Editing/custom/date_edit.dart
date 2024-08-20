import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/publish/publish_update/ride_publish_bloc.dart';

class DateEditScreen extends StatefulWidget {
  final String fromuid;
  const DateEditScreen({Key? key, required this.fromuid}) : super(key: key);

  @override
  _DateEditScreenState createState() => _DateEditScreenState();
}

class _DateEditScreenState extends State<DateEditScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/addCity');
                  },
                  label: Text(
                    "back",
                    style: TextStyle(
                      color: CustomColor.greenColor(),
                      fontSize: 15,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.greenColor(),
                    size: 15,
                  ),
                ),
              ),
              const Text(
                "When are you going?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TableCalendar(
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: CustomColor.greenColor(),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                DateFormat('dd-MM-yyyy').format(_selectedDay),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {


            String date = DateFormat('dd-MM-yyyy').format(_selectedDay);

            // Dispatch the event with the rideId
            BlocProvider.of<RidePublishBloc>(context).add(
              AddDateEvent(
                date: date,
                fromuid: widget.fromuid, // Pass the ride ID here
              ),
            );

            // Show a SnackBar for feedback
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('date updated successfully!'),
              ),
            );

            Navigator.pop(context, DateFormat('dd-MM-yyyy').format(_selectedDay));
          },
          backgroundColor: CustomColor.greenColor(),
          foregroundColor: CustomColor.whiteColor(),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
