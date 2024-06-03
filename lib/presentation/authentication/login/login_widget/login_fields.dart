// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/utils/textfield.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/validator.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
}

bool obtext = true;

class LoginFields {
  static Widget emailFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        // Custom text form field
        controller: emailController,
        labelText: 'Email',
        hintText: 'Enter your email or phone',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Validator().emailValidator(value),
      ),
    );
  }

  static Widget passwordFields() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is TextState) {
          obtext = state.obscure;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            obscureText: obtext,
            controller: passwordController,
            labelText: 'password',
            hintText: 'Enter your password',
            suffixIcon: obtext
                ? IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context)
                          .add(TextEvent(obscure: obtext));
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context)
                          .add(TextEvent(obscure: obtext));
                    },
                  ),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => Validator().nameValidator(value),
          ),
        );
      },
    );
  }
}

class signagain extends StatelessWidget {
  const signagain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't hanve an account? "),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/signScreen');
          },
          child: Text(
            'sign up',
            style: TextStyle(
                color: CustomColor.redColor(),
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}

class forgot extends StatelessWidget {
  const forgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/forgotScreen');
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(
                  color: CustomColor.redColor(),
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
