import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmokingScreen extends StatefulWidget {
  const SmokingScreen({super.key});

  @override
  State<SmokingScreen> createState() => _SmokingScreenState();
}

class _SmokingScreenState extends State<SmokingScreen> {
 String _selectedSmoke = '';

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/addPreference');
                  },
                  label: Text(
                    "Back",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 15),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.greenColor(),
                    size: 15,
                  ),
                ),
              ),
              const Text(
                'Smoking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.smoking_rooms,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I\'m fine with smoking.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value: 'I\'m fine with smoking.', // Assign unique values to each radio button
                    groupValue: _selectedSmoke,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedSmoke = value!;
                      });
                    },
                    activeColor: Colors
                        .blue, // Set the color when the radio button is selected
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors
                            .blue; // Set the color for the selected state
                      }
                      return CustomColor
                          .greenColor(); // Set the color for the unselected state
                    }),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.smoking_rooms,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Cigarette breaks outside the car \n are ok.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value: 'Cigarette breaks outside the car are ok.', // Assign unique values to each radio button
                    groupValue: _selectedSmoke,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedSmoke = value!;
                      });
                    },
                    activeColor: Colors
                        .blue, // Set the color when the radio button is selected
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return CustomColor
                            .greenColor(); // Set the color for the selected state
                      }
                      return Colors
                          .grey; // Set the color for the unselected state
                    }),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.smoking_rooms,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'No smoking, please.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value:   'No smoking, please.', // Assign unique values to each radio button
                    groupValue: _selectedSmoke,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedSmoke = value!;
                      });
                    },
                    activeColor: Colors
                        .blue, // Set the color when the radio button is selected
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return CustomColor
                            .greenColor(); // Set the color for the selected state
                      }
                      return Colors
                          .grey; // Set the color for the unselected state
                    }),
                  )
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    profileBloc.add(SmokingEvent(smoke: _selectedSmoke));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      color: CustomColor.greenColor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: CustomColor.whiteColor(),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
