import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

class PublisConfirm extends StatefulWidget {
  const PublisConfirm({super.key});

  @override
  State<PublisConfirm> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublisConfirm> {
  final TextEditingController searchController = TextEditingController();
  int PublisConfirm = 1;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              Image.asset('images/publish.png',
                  width: double.infinity, height: 200, fit: BoxFit.cover),
              // Image at the top
              // Image.network(
              //   'https://via.placeholder.com/300', // Replace with your image URL or asset
              //   width: double.infinity,
              //   height: 200,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(height: 16),
              // Text below the image
              const Text(
                'Coming back as well? \n Publish your return ride \n now!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Row with text on the left and icon on the right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/mybottom');
                    },
                    child: Text(
                      'yes, Sure!',
                      style: TextStyle(
                          fontSize: 18, color: CustomColor.greenColor()),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        size: 18, color: CustomColor.greyColor()),
                  )
                ],
              ),
              const divider_normal(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, '/successPublish');
                    },
                    child: Text(
                      'No, thanks!',
                      style: TextStyle(
                          fontSize: 18, color: CustomColor.greyColor()),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/successPublish');
                      },
                      icon: Icon(Icons.arrow_forward_ios_rounded,
                          size: 18, color: CustomColor.greyColor()))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
