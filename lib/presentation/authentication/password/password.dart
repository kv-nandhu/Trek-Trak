import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/authentication/password/password_widget/button_widget2.dart';
import 'package:trek_trak/presentation/authentication/password/password_widget/fields.dart';

// ignore: must_be_immutable
class PasswordScreen extends StatefulWidget {
  PasswordScreen({
    required this.email,
    required this.gender,
    required this.number,
    required this.name,
    super.key,
  });
  String name, number, gender, email;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Set Password",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Set your password",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                coustomPassword(
                    formKey: formKey,
                    passwordController: passwordController,
                    confirmpasswordController: confirmpasswordController),
                const SizedBox(
                  height: 55,
                ),
                registerButton(
                    formKey: formKey,
                    passwordController: passwordController,
                    widget: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
