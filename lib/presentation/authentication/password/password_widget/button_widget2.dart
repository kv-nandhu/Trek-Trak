// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';

class registerButton extends StatelessWidget {
  final String name, email, gender, number;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  
  registerButton({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.email,
    required this.gender,
    required this.name,
    required this.number, required PasswordScreen widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {
            final dummyUserModel = UserModel(
              email: email,
              name: name,
              number: number,
              gender: gender,
              // Add other required fields as needed
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserData(
                  password: passwordController.text,
                  email: email,
                  gender: gender,
                  name: name,
                  number: number,
                  userModel: dummyUserModel,
                ),
              ),
            );
          }
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
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whiteColor(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
