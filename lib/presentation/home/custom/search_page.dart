import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trek_trak/presentation/home/custom/drop_location.dart';
import 'package:trek_trak/presentation/home/custom/location.dart'; // Ensure this import is correct

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  String? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Rides'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fromController,
              decoration: const InputDecoration(
                labelText: 'From Location',
                suffixIcon: Icon(Icons.search),
              ),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationSearch(), // Location search page
                  ),
                );
                if (result != null) {
                  _fromController.text = result['pickuplocation'];
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _toController,
              decoration: const InputDecoration(
                labelText: 'To Location',
                suffixIcon: Icon(Icons.search),
              ),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DropLocationSearcing(), // Location search page
                  ),
                );
                if (result != null) {
                  _toController.text = result['droplocation'];
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: _selectedDate ?? 'Select Date',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                final selectedDate = await _selectDate(context);
                if (selectedDate != null) {
                  setState(() {
                    _selectedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'from': _fromController.text,
                  'to': _toController.text,
                  'date': _selectedDate,
                });
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }
}
