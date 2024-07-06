import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _PublishPageState();
}

class _PublishPageState extends State<AddCity> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                "Add stopovers to get more passengers",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/cityAddMap');
                    },
                    child: Text(
                      "Add city",
                      style: TextStyle(
                          fontSize: 15, color: CustomColor.greenColor()),
                    )),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the next screen
            Navigator.pushNamed(context, '/locationPickerPage');
          },
          backgroundColor: CustomColor.greenColor(), // Set the background color
          foregroundColor: CustomColor.whiteColor(), // Set the icon color
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
