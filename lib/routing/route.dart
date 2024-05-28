import 'package:flutter/widgets.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_screen.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart' as signUpFields;
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/presentation/authentication/login/login_screen.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/password/password_widget/button_widget2.dart' as passwordFields;
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/presentation/authentication/splash/splash.dart';
import 'package:trek_trak/presentation/authentication/success/success.dart';
import 'package:trek_trak/presentation/home/home.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

class Routers {
  Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const ScreenSplash(),
    '/first' : (context) => const FirstScreen(),
    '/sign' :(context) => const SignScreen(),
    '/password' :(context) => PasswordScreen(
      email: emailController.text,
      gender: signUpFields.selectedGender.toString(),
      name: nameController.text,
      number: phoneController.text,
    ),
    '/UserData' :(context) => const UserData(),
    '/Success' :(context) => const SuccessScreen(),
    '/login': (context) => const LoginScreen(),
    '/home' :(context) => const HomeScreen(),
  };
}
