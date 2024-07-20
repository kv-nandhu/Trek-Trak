// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String email;
  final String gender;
  final String name;
  final String number;

  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.email,
    required this.gender,
    required this.name,
    required this.number,
  });

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  double _offset = 50.0;
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _offset = 0.0;
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget buildOtpInput({required int index}) {
    return Container(
      width: 50,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: _otpControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 22),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 5) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: _offset),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Adjusted top padding
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Phone Verification',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text("Enter your OTP", style: TextStyle(color: Colors.black)),
              ],
            ),
            const SizedBox(height: 30), // Space between text and form
            Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(6, (index) => buildOtpInput(index: index)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Did not receive the OTP? ",
                    style: TextStyle(color: CustomColor.blackColor())),
                Text("Resend",
                    style: TextStyle(color: CustomColor.greenColor())),
              ],
            ),
            const SizedBox(height: 50), // Space before the button
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          String otp =
                              _otpControllers.map((e) => e.text).join();
                          try {
                            context.read<AuthBloc>().add(verificationOtpEvent(
                                  otp: otp,
                                  verificationId: widget.verificationId,
                                  number: widget.number,
                                  email: widget.email,
                                  gender: widget.gender,
                                  name: widget.name,
                                  context: context,
                                ));
                          } catch (ex) {
                            if (kDebugMode) {
                              print(ex.toString());
                            }
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: CustomColor.greenColor(),
                            borderRadius: BorderRadius.circular(10)),
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                           if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Send',
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
                  ),
                ],
              ),
            ),
            const Spacer(), // Pushes content up
          ],
        ),
      ),
    );
  }
}
