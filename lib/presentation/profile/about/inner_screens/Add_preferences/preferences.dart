import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class AddPreference extends StatefulWidget {
  const AddPreference({super.key});

  @override
  State<AddPreference> createState() => _AddPreferenceState();
}

class _AddPreferenceState extends State<AddPreference> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Title(
                  color: CustomColor.blackColor(),
                  child: Text("Tavel preferences",
                      style: TextStyle(
                          color: CustomColor.blackColor(),
                          fontSize: 26,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Chatiness"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/chattinessScreen');
                  },
                  child: Text(
                    "I'm chatty when I feel comfortable",
                    style: TextStyle(
                        color: CustomColor.greenColor(),
                        fontSize: 19,
                        height: 0.1),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Music"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/musicScreen');
                  },
                  child: Text(
                    "I'll jam depending on the modd",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 19),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Smoking"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/smokingScreen');
                  },
                  child: Text(
                    "Cigarette breaks outside the car are ok",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 19),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Pets"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/petsScreen');
                  },
                  child: Text(
                    "I'll travel with pets depending on the animal",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 19),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
