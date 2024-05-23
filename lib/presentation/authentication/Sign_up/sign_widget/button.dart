import 'package:flutter/material.dart';
import 'package:trek_trak/Application/bloc/auth_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart';
import 'package:trek_trak/repository/Auth_repos/auth_repo.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons {
  static signUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          UserModel user = UserModel(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
          );
          BlocProvider.of<AuthBloc>(context).add(SignupEvent(user: user));
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
              'Sign Up',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CustomColor.whiteColor(),
              ),
            ),
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
                    child: Image.asset(
                      "images/google.png",
                    )),
                const SizedBox(
                  width: 6,
                ),
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
