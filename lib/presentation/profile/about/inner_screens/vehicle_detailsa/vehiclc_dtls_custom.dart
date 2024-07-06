// vehicle_details.dart
import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/vehicle_details.dart';

class VehicleDetails extends StatelessWidget {
  final UserModel userModel;

  const VehicleDetails({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${userModel.vbrand!} ${userModel.vmodel!}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                userModel.vcolor!,
                style: TextStyle(
                    color: CustomColor.greyColor(),
                    fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: userModel.image != null
                    ? NetworkImage(userModel.image!)
                    : null,
                child: userModel.image == null
                    ? Icon(Icons.person, size: 60)
                    : null,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VehicleDetailScreen(
                        userModel: userModel,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
