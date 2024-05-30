import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        body: Column(
          children: [
            Title(
                color: CustomColor.blackColor(),
                child: Text("Personal details",
                    style: TextStyle(color: CustomColor.greyColor()))),
            Text("First name"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Nandhu Krishna",
                  style: TextStyle(color: CustomColor.greenColor()),
                )),
            SizedBox(
              height: 15,
            ),
            Text("Last name"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "KV",
                  style: TextStyle(color: CustomColor.greenColor()),
                )),
            SizedBox(
              height: 15,
            ),
            Text("Date of birth"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "06/05/2002",
                  style: TextStyle(color: CustomColor.greenColor()),
                )),
            SizedBox(
              height: 15,
            ),
            Text("Mobile phone"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "9778574297",
                  style: TextStyle(color: CustomColor.greenColor()),
                )),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle_outline_sharp),
                    color: CustomColor.greenColor()),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Add mini bio",
                      style: TextStyle(color: CustomColor.greenColor()),
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
