import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

class VehicleDetailScreen extends StatefulWidget {
  final UserModel userModel;

  VehicleDetailScreen({super.key, required this.userModel});

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${widget.userModel.vbrand!} ${widget.userModel.vmodel!}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userModel.vcolor!,
                style: TextStyle(color: CustomColor.greyColor(), fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/PlateNumber');
                },
           
                child: Text(
                  "Edit info",
                  style: TextStyle(fontSize: 17, color: CustomColor.greenColor()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Dividers.lineOne(),
              SizedBox(
                height: 10,
              ),
              Text(
                "delete vehicle",
                style: TextStyle(fontSize: 17, color: CustomColor.greenColor()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
