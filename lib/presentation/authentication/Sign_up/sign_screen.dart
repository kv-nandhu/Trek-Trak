// ignore_for_file: use_key_in_widget_constructors, depend_on_referenced_packages, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/button.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/terms_privacy.dart';
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/utils/divider.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final formKey = GlobalKey<FormState>();
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    final authbloc = BlocProvider.of<AuthBloc>(context);
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/mybottom', (route) => false);
            });
          }
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                    key: formKey,
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
                            "Sign up with your email or phone number",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Fields.nameFields()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Fields.emailFields(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Fields.phoneFields(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomGenderDropdown(
                            value: _selectedGender,
                            onChanged: (newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Agree.terms(),
                              Agree.privacy(),
                              const SizedBox(
                                height: 10,
                              ),
                              Buttons.signUp(
                                context,
                                formKey,
                              ),
                              const SizedBox(height: 10),
                              Dividers.line(),
                              const SizedBox(height: 10),
                              Buttons.signGoogle(context),
                              const SizedBox(height: 10),
                              Agree.account(),
                            ],
                          ),
                        ),
                      ],
                    ),
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
