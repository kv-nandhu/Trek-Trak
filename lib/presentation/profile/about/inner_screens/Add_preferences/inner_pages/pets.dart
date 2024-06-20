import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
String _slecetedPet = '';

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
                'Pet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.pets,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Pets welcome. woof!.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value: 'Pets welcome. woof!', // Assign unique values to each radio button
                    groupValue: _slecetedPet,
                    onChanged: (String? value) {
                      setState(() {
                        _slecetedPet = value!;
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
                    Icons.pets,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I\'ll travell with pets depending on \n the animal.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value:  'I\'ll travell with pets depending on \n the animal.', // Assign unique values to each radio button
                    groupValue: _slecetedPet,
                    onChanged: (String? value) {
                      setState(() {
                        _slecetedPet = value!;
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
                    Icons.pets,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'i\'d prefer not to travel with pets.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value:  'i\'d prefer not to travel with pets.', // Assign unique values to each radio button
                    groupValue: _slecetedPet,
                    onChanged: (String? value) {
                      setState(() {
                        _slecetedPet = value!;
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
                    profileBloc.add(PetEvent(pet: _slecetedPet));
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
