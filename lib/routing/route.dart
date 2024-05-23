import 'package:flutter/widgets.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_screen.dart';
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/presentation/authentication/login/login_screen.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/presentation/authentication/splash/splash.dart';
import 'package:trek_trak/presentation/authentication/success/success.dart';
import 'package:trek_trak/presentation/home/home.dart';


class Routers{
Map<String, Widget Function(BuildContext)> routes= {        
        '/' : (context) => const ScreenSplash(),
        '/first' : (context) => const FirstScreen(),
        '/sign' :(context) => const SignScreen(),
        '/password' :(context) => const PasswordScreen(),
        '/UserData' :(context) => const UserData(),
        '/Success' :(context) => const SuccessScreen(),
        '/login': (context) => const LoginScreen(),
        '/home' :(context) => const HomeScreen(),
      };
}
   