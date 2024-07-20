import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

class AddBioScreen extends StatelessWidget {
  const AddBioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String exampleText = 'Enter your About';
    final TextEditingController minibioController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/mybottom');
                    },
                    label: Text(
                      "Back",
                      style: TextStyle(
                        color: CustomColor.greenColor(),
                        fontSize: 20,
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: CustomColor.greenColor(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      String bio = minibioController.text;
                      context.read<ProfileBloc>().add(AddBioEvent(miniBio: bio));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Bio saved successfully!'),
                        ),
                      );
                      waitAndNavigateBack(context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'What would you like \n other members to know \n about you?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Grey background color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: minibioController,
                  maxLines: 6,
                  onChanged: (value) {
                    exampleText = value.isEmpty ? 'Enter your About' : '';
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
      ),
    );
  }
  void waitAndNavigateBack(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
          Navigator.pushReplacementNamed(context, '/mybottom');
    });
  }
}
