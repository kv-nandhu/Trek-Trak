
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

class PlateNumber extends StatefulWidget {
  const PlateNumber({super.key});

  @override
  State<PlateNumber> createState() => _PlateNumberState();
}

class _PlateNumberState extends State<PlateNumber> {
  String? selectedCountry;
  String exampleText = 'KL 45 R 4950';
  final TextEditingController numberPlateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/mybottom');
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
                    'What is your license plate number?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "COUNTRY",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: CountryCodePicker(
                              onChanged: (country) {
                                setState(() {
                                  selectedCountry = country.name;
                                });
                                Navigator.of(context).pop();
                              },
                              initialSelection: 'US',
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: true,
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      selectedCountry == null
                          ? 'Select a country'
                          : selectedCountry!,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Grey background color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: numberPlateController,
                      maxLines: 1,
                      onChanged: (value) {
                       
                          exampleText = value.isEmpty ? 'KL 45 R 4950' : '';
                      
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                        hintText: exampleText,
                        contentPadding: const EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: () {
                     String vehiclenumber = numberPlateController.text;
                    context.read<ProfileBloc>().add(VehicleNumberEvent(vnumber: vehiclenumber));
                    Navigator.pushReplacementNamed(context, '/brandVehicle');
                
                  },
                  icon: Icon(Icons.arrow_circle_right_outlined),
                  color: CustomColor.greenColor(),
                  iconSize: 40.0, // Optional: Adjust the icon size
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
