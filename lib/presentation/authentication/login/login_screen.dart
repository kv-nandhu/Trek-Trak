// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/bloc/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_button.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authblocc = BlocProvider.of<AuthBloc>(context);
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: CustomColor.greenColor(),
              ),
            );
          }
          if (state is Authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            });
          }
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FirstScreen()));
                        },
                        icon: const Icon(Icons.arrow_back_outlined),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Sign in with your email or phone number",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            LoginFields.emailFields(),
                            LoginFields.passwordFields(),
                          ],
                        ),
                      ),
                      LoginFields.forgot(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          LoginButtons.signIn(context),
                          const SizedBox(height: 30),
                          Dividers.line(),
                          const SizedBox(height: 30),
                          LoginButtons.signGoogle(context),
                        ],
                      ),
                      const SizedBox(height: 40),
                      LoginFields.signUp(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
