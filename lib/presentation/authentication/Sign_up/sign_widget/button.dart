// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart';
import 'package:trek_trak/repository/Auth_repos/auth_repo.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Buttons {
  static Widget signUp(BuildContext context, GlobalKey<FormState> formKey) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthBloc>().add(sentotpEvent(
                  name: nameController.text,
                  email: emailController.text,
                  number: phoneController.text,
                  gender: selectedGender.toString(),
                  context: context,
                ));
          }
        },
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColor.greenColor(),
          ),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: CustomColor.whiteColor(),
                  size: 50,
                ));
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whiteColor(),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  static Widget signGoogle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            signInWithGoogle(context, true);
          },
          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: CustomColor.greenColor()),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  child: Image.asset("images/google.png"),
                ),
                const SizedBox(width: 6),
                Text(
                  'Sign Up with Google',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor
                        .greenColor(), // Text color same as border color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
