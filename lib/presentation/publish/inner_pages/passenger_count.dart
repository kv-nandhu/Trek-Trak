import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class PassengerCount extends StatefulWidget {
  const PassengerCount({super.key});

  @override
  State<PassengerCount> createState() => _PassengerCountState();
}

class _PassengerCountState extends State<PassengerCount> {
  int passengerCount = 1;
  bool checkBoxValue = false;

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
                "So how many passengers \n can you take?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 1),
                    Container(
                      height: 55,
                      width: 55,
                      child: CircleAvatar(
                        backgroundColor: CustomColor.greenColor(),
                        child: IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (passengerCount > 1) {
                                passengerCount--;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      '$passengerCount',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      child: CircleAvatar(
                        backgroundColor: CustomColor.greenColor(),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              passengerCount++;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 1),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Passenger Options",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.accessibility),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Max. 2 in the back",
                        style: TextStyle(fontSize: 18),
                      ),
                      const Text(
                        "Think comfort, keep the middle \n seat empty",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool? newValue) {
                      setState(() {
                        checkBoxValue = newValue!;
                      });
                    },
                    activeColor: CustomColor.greenColor(),
                    checkColor: CustomColor.whiteColor(),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, {'passengerCount': passengerCount, });
          },
          backgroundColor: CustomColor.greenColor(),
          foregroundColor: CustomColor.whiteColor(),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
