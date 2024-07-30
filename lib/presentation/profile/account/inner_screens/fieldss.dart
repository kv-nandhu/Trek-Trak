import 'package:flutter/material.dart';
import 'package:trek_trak/Application/Auth/auth_bloc.dart';
import 'package:trek_trak/infrastructure/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/presentation/authentication/login/login_widget/login_fields.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class closeAccount extends StatelessWidget {
  const closeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "close account",
          style: TextStyle(color: CustomColor.greenColor()),
        ));
  }
}

class moreInfo extends StatelessWidget {
  const moreInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}

class dataProtection extends StatelessWidget {
  const dataProtection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}

class termsAndConditions extends StatelessWidget {
  const termsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}

class postalAddress extends StatelessWidget {
  const postalAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}

class changePaswword extends StatelessWidget {
  const changePaswword({
    super.key,
    required this.pass,
  });

  final ResetPassRespo pass;

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                icon: const Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ));
  }
}

class rating extends StatelessWidget {
  const rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}


class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
                 
          showLogoutDialog(context);
        },
        child: Text(
          "Log out",
          style: TextStyle(color: CustomColor.greenColor()),
        ));
  }
}



 void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log out'),
              onPressed: () {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(LogoutEvent());
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }