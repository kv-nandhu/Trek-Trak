import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  int? selectedAddressIndex;
  int? index;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                'Music',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.music_note_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'It\'s all about the playlist.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<int>(
                    value: 2, // Assign unique values to each radio button
                    groupValue: selectedAddressIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedAddressIndex = value;
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
                    Icons.music_note_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I\'ll jam depending on the mood.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<int>(
                    value: 2, // Assign unique values to each radio button
                    groupValue: selectedAddressIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedAddressIndex = value;
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
                    Icons.music_note_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Silence is golden.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<int>(
                    value: 2, // Assign unique values to each radio button
                    groupValue: selectedAddressIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedAddressIndex = value;
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
                  onTap: () {},
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