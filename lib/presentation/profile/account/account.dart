import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
   ResetPassRespo pass = ResetPassRespo();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Rating",
                        style: TextStyle(color: CustomColor.blackColor()),
                      )),
                      IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              Dividers.lineOne(),
              TextButton(
                  onPressed: () {
                     pass.resetPassword(context, emailController.text);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        "Change password",
                        style: TextStyle(color: CustomColor.blackColor()),
                      ),
                      IconButton(
                          onPressed: () {
                             pass.resetPassword(context, emailController.text);
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Postal address",
                        style: TextStyle(color: CustomColor.blackColor()),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              Dividers.lineOne(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(color: CustomColor.blackColor()),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Data Protection",
                        style: TextStyle(color: CustomColor.blackColor()),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "More INFO",
                        style: TextStyle(color: CustomColor.blackColor()),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              Dividers.lineOne(),
              TextButton(
                  onPressed: () {
                     final authBoc = BlocProvider.of<AuthBloc>(context);
                  authBoc.add(LogoutEvent());
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(color: CustomColor.greenColor()),
                  )),
              Dividers.lineOne(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "close account",
                    style: TextStyle(color: CustomColor.greenColor()),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
