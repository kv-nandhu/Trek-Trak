import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class AddBioScreen extends StatefulWidget {
  const AddBioScreen({super.key});

  @override
  State<AddBioScreen> createState() => _AddBioScreenState();
}

class _AddBioScreenState extends State<AddBioScreen> {
  int? selectedAddressIndex;
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

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
                    Navigator.pushReplacementNamed(context, '/mybottom');
                  },
                  label: Text(
                    "Back",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.greenColor(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'What would you like \n other members to know \n about you?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: addressController,
                maxLines: 10, // Set maximum lines to 10
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set corner radius
                    borderSide: BorderSide(
                      color: Colors.grey, // Set the border color
                      width: 1.0, // Set the border width (thin)
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set corner radius
                    borderSide: BorderSide(
                      color: Colors.grey, // Set the border color
                      width: 1.0, // Set the border width (thin)
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set corner radius
                    borderSide: BorderSide(
                      color: Colors.blue, // Set the border color when focused
                      width: 1.0, // Set the border width (thin)
                    ),
                  ),
                  labelText: 'Enter your address',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
