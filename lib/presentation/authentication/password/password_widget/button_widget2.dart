

import 'package:flutter/material.dart';
import 'package:trek_trak/Application/bloc/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController emailController = TextEditingController();
String? selectedGender;
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class ButtonsRegister {
  static Widget register(BuildContext context, GlobalKey<FormState> formKey) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<AuthBloc>(context).add(
              signwithemailandpasswordEvent(
                password: passwordController.text,
                name: nameController.text,
                number: phoneController.text,
                gender: selectedGender.toString(),
                email: emailController.text,
                context: context,
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
                if(state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
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
