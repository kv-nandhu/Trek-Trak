// ignore_for_file: depend_on_referenced_packages, library_prefixes

import 'package:flutter/widgets.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_screen.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart' as signUpFields;
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/presentation/authentication/login/login_screen.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/presentation/authentication/splash/splash.dart';
import 'package:trek_trak/presentation/authentication/success/success.dart';
import 'package:trek_trak/presentation/chat/chat.dart';
import 'package:trek_trak/presentation/home/home.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/dp_adding.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/personal_details.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/profile_editing/edit_profile.dart';
import 'package:trek_trak/presentation/profile/profile.dart';
import 'package:trek_trak/presentation/publish/profile.dart';
import 'package:trek_trak/presentation/ride/ride.dart';
import 'package:trek_trak/utils/bottomNaviationBar/bottom.dart';
import 'package:trek_trak/utils/loading.dart';
import 'package:loading_indicator/loading_indicator.dart'; 

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
    '/publish' :(context) =>  const PublishPage(),
    '/history' :(context) =>  const RidePage(),
    '/chat' :(context) =>  const ChatPage(),
    '/profile' :(context) =>  const ProfilePage(),
    '/mybottom' :(context) =>  const MyBottom(),
    '/editProfile' :(context) =>  const EditProfile(),
    '/ProfileAdd' :(context) =>  const ProfileAdding(),
    '/personalDetail' :(context) =>  const PersonalDetail(),
     '/loading': (context) => const CustomLoadingIndicator(indicator: Indicator.ballSpinFadeLoader),

  };
}
