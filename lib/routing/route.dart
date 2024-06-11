import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:trek_trak/Application/profile/profile_bloc.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_screen.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart'
    as signUpFields;
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/presentation/authentication/forgot/forgot.dart';
import 'package:trek_trak/presentation/authentication/login/login_screen.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/presentation/authentication/splash/splash.dart';
import 'package:trek_trak/presentation/authentication/success/success.dart';
import 'package:trek_trak/presentation/chat/chat.dart';
import 'package:trek_trak/presentation/home/home.dart';
import 'package:trek_trak/presentation/profile/about/about.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/chati.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/music.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/pets.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/smoking.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/preferences.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/add_bio/bio.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/dp_adding.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/edit_personal/personal_details.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/profile_editing/edit_profile.dart';
import 'package:trek_trak/presentation/profile/profile.dart';
import 'package:trek_trak/presentation/publish/profile.dart';
import 'package:trek_trak/presentation/ride/ride.dart';
import 'package:trek_trak/utils/bottomNaviationBar/bottom.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

class Routers {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const ScreenSplash(),
    '/first': (context) => const FirstScreen(),
    '/sign': (context) => const SignScreen(),
    '/password': (context) => PasswordScreen(
          email: emailController.text,
          gender: signUpFields.selectedGender.toString(),
          name: nameController.text,
          number: phoneController.text,
        ),
    '/UserData': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return UserData(
        email: args['email'],
        gender: args['gender'],
        name: args['name'],
        password: args['password'],
        number: args['number'], 
        userModel: args['usermodel'],
      );
    },
    '/Success': (context) => const SuccessScreen(),
    '/signScreen': (context) => const SignScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/publish': (context) => const PublishPage(),
    '/history': (context) => const RidePage(),
    '/chat': (context) => const ChatPage(),
    '/profile': (context) => const ProfilePage(),
    '/mybottom': (context) => const MyBottom(),
    '/editProfile': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return EditProfile(
        userModel: args['userModel'],
      );
    },
    '/ProfileAdd': (context) { final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return ProfileAdding(
        userModel: args['userModel'],
      );},
      


    '/personalDetail': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return PersonalDetail(
        selectedImage: args['selectedImage'],
        userModel: args['userModel'],
      );
    },
    '/addPreference': (context) => const AddPreference(),
    '/chattinessScreen': (context) => const ChattinessScreen(),
    '/petsScreen': (context) => const PetsScreen(),
    '/musicScreen': (context) => const MusicScreen(),
    '/smokingScreen': (context) => const SmokingScreen(),
    '/aboutScreen': (context) => const AboutScreen(),
    '/addBioScreen': (context) => const AddBioScreen(),
    '/forgotScreen': (context) => const ForgotScreen(),
  };
}
