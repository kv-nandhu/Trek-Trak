// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/utils/color/color.dart';

class registerButton extends StatelessWidget {
String name,email,gender,phone;
   registerButton({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.widget,
    required this.email,
    required this.gender,
    required this.name,
    required this.phone
  });
 
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final PasswordScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {

          if (formKey.currentState!.validate()) {
            // BlocProvider.of<AuthBloc>(context).add(
            //     signwithemailandpasswordEvent(
            //         password: passwordController.text,
            //         name: widget.name,
            //         number: widget.number,
            //         gender: widget.gender,
            //         email: widget.email,
            //         context: context));
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserData(password: passwordController.text, email: '', gender: '', name: '',),));
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
