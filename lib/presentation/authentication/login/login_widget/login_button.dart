import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/repository/Auth_repos/auth_repo.dart';
import 'package:trek_trak/utils/color/color.dart';

import '../../../../Application/Auth/auth_bloc.dart';

class LoginButtons {
  static signIn(BuildContext context) {
    return InkResponse(
      onTap: () {
        BlocProvider.of<AuthBloc>(context).add(LoginEvent(
            password: passwordController.text.trim(),
            email: emailController.text.trim()));
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
            'Sign In',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CustomColor.whiteColor(),
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
        color: Colors
            .transparent, // Set to transparent to make the material widget transparent
        child: InkWell(
          onTap: () {
            signInWithGoogle(context, true);
          },
          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: CustomColor.greenColor()), // Set the border color
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
                  'Sign in with Google',
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
