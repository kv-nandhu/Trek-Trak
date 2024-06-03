import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({super.key});

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
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
                  child: Text("Personal details",
                      style: TextStyle(
                          color: CustomColor.blackColor(),
                          fontSize: 26,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("First name"),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Nandhu Krishna",
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
                child: Text("Last name"),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "KV",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 19),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Date of birth"),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "06/05/2002",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 19),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Mobile phone"),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "9778574297",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 19),
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 410,
                child: Divider(
                  thickness: 2,
                  color: CustomColor.greyColor(),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline_sharp),
                      color: CustomColor.greenColor()),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add mini bio",
                        style: TextStyle(
                            color: CustomColor.greenColor(), fontSize: 19),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
