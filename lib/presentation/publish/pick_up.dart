import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class PickLocation extends StatefulWidget {
  PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PublishPageState();
}

class _PublishPageState extends State<PickLocation> {
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
                        color: CustomColor.greenColor(), fontSize: 15),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.greenColor(),
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pick-up",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                    },
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
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
