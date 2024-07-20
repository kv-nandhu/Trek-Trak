import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Rides'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fromController,
              decoration: InputDecoration(
                labelText: 'From',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _toController,
              decoration: InputDecoration(
                labelText: 'To',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'from': _fromController.text,
                  'to': _toController.text,
                  'date': _dateController.text,
                });
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
