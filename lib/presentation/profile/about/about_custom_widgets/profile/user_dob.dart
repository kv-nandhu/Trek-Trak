import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';

class UserDobEditing extends StatelessWidget {
  final UserModel userModel;
  final TextEditingController dateController;

  UserDobEditing({Key? key, required this.userModel})
      : dateController = TextEditingController(text: userModel.dob),
        super(key: key);

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
              const SizedBox(height: 20),
              const Text(
                'What\'s your date of \n birth?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: dateController,
                  maxLines: 1,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    String dob = dateController.text;
                    context.read<ProfileBloc>().add(UserDobEvent(dob: dob));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      color: CustomColor.greenColor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: CustomColor.whiteColor(),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
