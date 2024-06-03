import 'package:flutter/material.dart';
import 'package:trek_trak/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/textfield.dart';
import 'package:trek_trak/utils/validator.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController emailController = TextEditingController();
  ResetPassRespo pass = ResetPassRespo();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                label: Text(
                  "Back",
                  style:
                      TextStyle(color: CustomColor.greenColor(), fontSize: 20),
                ),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColor.greenColor(),
                ),
              ),
            ),
            Title(
                color: CustomColor.blackColor(),
                child: Text("Verification with Email")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                // Custom text form field
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email or phone',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validator().emailValidator(value),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            InkResponse(
              onTap: () {
                pass.resetPassword(context, emailController.text);
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CustomColor.greenColor(),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whiteColor(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
