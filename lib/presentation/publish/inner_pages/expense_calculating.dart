import 'dart:math' as math;
import 'package:flutter/material.dart';

class CalculateMileageScreen extends StatefulWidget {
  final String? p_lang;
  final String? p_lati;
  final String? d_lang;
  final String? d_lati;

  CalculateMileageScreen({
    required this.p_lang,
    required this.p_lati,
    required this.d_lang,
    required this.d_lati,
  });

  @override
  _CalculateMileageScreenState createState() => _CalculateMileageScreenState();
}

class _CalculateMileageScreenState extends State<CalculateMileageScreen> {
  final _mileageController = TextEditingController();
  double _expense = 0.0;
  double _distance = 0.0;
  String _selectedFuelType = 'Petrol'; // Default fuel type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Travel Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedFuelType,
              items: ['Petrol', 'Diesel', 'Electric'].map((fuelType) {
                return DropdownMenuItem<String>(
                  value: fuelType,
                  child: Text(fuelType),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedFuelType = newValue;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Select Fuel Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _mileageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your vehicle mileage (km/l)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _calculateExpense();
              },
              child: Text('Calculate Expense'),
            ),
            SizedBox(height: 16),
            Text(
              'Total Travel Expense: ₹${_expense.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveExpense();
              },
              child: Text('Save Expense'),
            ),
            SizedBox(height: 16),
            Text(
              'Distance: ${_distance.toStringAsFixed(2)} km',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateExpense() {
    final mileage = double.tryParse(_mileageController.text);
    final pickLatitude = double.tryParse(widget.p_lati!);
    final pickLongitude = double.tryParse(widget.p_lang!);
    final dropLatitude = double.tryParse(widget.d_lati!);
    final dropLongitude = double.tryParse(widget.d_lang!);

    if (mileage != null &&
        pickLatitude != null &&
        pickLongitude != null &&
        dropLatitude != null &&
        dropLongitude != null) {
      final distance = calculateDistance(
          pickLatitude, pickLongitude, dropLatitude, dropLongitude);
      double fuelPricePerLiter = 0.0;

      // Set fuel price per liter based on selected fuel type
      switch (_selectedFuelType) {
        case 'Petrol':
          fuelPricePerLiter = 105.0; // ₹100 per liter (example)
          break;
        case 'Diesel':
          fuelPricePerLiter = 95.0; // ₹95 per liter (example)
          break;
        case 'Electric':
          fuelPricePerLiter = 80.0; // ₹70 per equivalent "liter" (example)
          break;
        default:
          fuelPricePerLiter = 100.0; // Default price for Petrol
      }

      setState(() {
        _distance = distance;
        _expense = (distance / mileage) * fuelPricePerLiter;
      });

      // Print the calculation steps to the terminal
      print('Distance: $distance km');
      print('Mileage: $mileage km/l');
      print('Fuel Price per Liter: ₹$fuelPricePerLiter');
      print('Total Expense: ₹${_expense.toStringAsFixed(2)}');
    } else {
      setState(() {
        _expense = 0.0;
        _distance = 0.0;
      });
    }
  }
double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }



 double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371; // Radius of the Earth in kilometers
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }
  void _saveExpense() {
    Navigator.pop(context, _expense.toStringAsFixed(2));
  }

  @override
  void dispose() {
    _mileageController.dispose();
    super.dispose();
  }
}
