import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/fields.dart';
import 'package:trek_trak/presentation/authentication/password/password_widget/button_widget2.dart';

class PasswordScreen extends StatefulWidget {
   PasswordScreen({ required String email, required String gender, required String number, required String name, Key? key,}) : super(key: key);
  late String name, number, gender,email;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  final formKey = GlobalKey<FormState>();

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
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Password.passwordFields()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Password.newPasswordFields(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                ButtonsRegister.register(context,formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
