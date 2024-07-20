// ignore_for_file: equal_keys_in_map

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_screen.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/fields.dart'
    // ignore: library_prefixes
    as signUpFields;
import 'package:trek_trak/presentation/authentication/first_screen/first_screen.dart';
import 'package:trek_trak/presentation/authentication/forgot/forgot.dart';
import 'package:trek_trak/presentation/authentication/login/login_screen.dart';
import 'package:trek_trak/presentation/authentication/password/password.dart';
import 'package:trek_trak/presentation/authentication/profile/profile_screen.dart';
import 'package:trek_trak/presentation/authentication/splash/splash.dart';
import 'package:trek_trak/presentation/authentication/success/success.dart';
import 'package:trek_trak/presentation/chat/chat.dart';
import 'package:trek_trak/presentation/home/custom/search_screen.dart';
import 'package:trek_trak/presentation/profile/about/about.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_dob.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_email.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_name.dart';
import 'package:trek_trak/presentation/profile/about/about_custom_widgets/profile/user_number.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/chati.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/music.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/pets.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/inner_pages/smoking.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/Add_preferences/preferences.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/add_bio/bio.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/dp_adding.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/edit_personal/personal_details.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/profile_editing/edit_profile.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/brand.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/color.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/licence_detils.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/vehicle_details.dart';
import 'package:trek_trak/presentation/profile/about/inner_screens/vehicle_detailsa/vehicle_model.dart';
import 'package:trek_trak/presentation/profile/profile.dart';
import 'package:trek_trak/presentation/publish/demo_pages/example_pick.dart';
import 'package:trek_trak/presentation/publish/inner_pages/add_city.dart';
import 'package:trek_trak/presentation/publish/inner_pages/calander.dart';
import 'package:trek_trak/presentation/publish/demo_pages/drop_demo.dart';
import 'package:trek_trak/presentation/publish/inner_pages/drop_off.dart';
import 'package:trek_trak/presentation/publish/inner_pages/expense_calculating.dart';
import 'package:trek_trak/presentation/publish/inner_pages/multiple_demo.dart';
import 'package:trek_trak/presentation/publish/inner_pages/time_select.dart';
import 'package:trek_trak/presentation/publish/publish_home/publish_home.dart.dart';
import 'package:trek_trak/presentation/publish/inner_pages/passenger_count.dart';
import 'package:trek_trak/presentation/publish/inner_pages/publish_confirm.dart';
import 'package:trek_trak/presentation/publish/inner_pages/success_publish.dart';
import 'package:trek_trak/presentation/publish/publish_Editing/publish_editing.dart';
import 'package:trek_trak/presentation/ride/ride.dart';
import 'package:trek_trak/presentation/ride/ride_main.dart';
import 'package:trek_trak/presentation/ride_joining/custom/user_details/user_details.dart';
import 'package:trek_trak/presentation/ride_joining/ride_detail.dart';
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
    // '/home': (context) => const HomeScreen(),

    '/history': (context) => const RidePage(),
    '/chat': (context) => ChatListPage(),
    '/profile': (context) => const ProfilePage(),
    '/mybottom': (context) => const MyBottom(),
    '/editProfile': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return EditProfile(
        userModel: args['userModel'],
      );
    },
    '/ProfileAdd': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return ProfileAdding(
        userModel: args['userModel'],
      );
    },
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
    '/PlateNumber': (context) => const PlateNumber(),
    '/brandVehicle': (context) => const BrandVehicle(),
    '/colorListScreen': (context) => ColorListScreen(),
    '/rideMainPage': (context) => RideMainPage(),
    '/searchScreen': (context) => SearchScreen(),

     '/profilePagePublishSide': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return ProfilePagePublishSide(
        userModel: args['userModel'],
      );
    },
    // '/publishingRideDetails': (context) => PublishingRideDetails(,),

       '/publishingRideDetails': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return PublishingRideDetails(
     pickuplocation: args['pickuplocation'],
        dropitlocation: args['dropitlocation'],
        time: args['time'],
        date: args['date'],
        passengercount: args['passengercount'],
        expence: args['expence'],
        uname: args['u_name'], 
        fromid: args['u_uid'],
         uid: args['uid'],
      );
    },
    '/publishEditing': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return PublishEditing(
     pickuplocation: args['pickuplocation'],
        dropitlocation: args['dropitlocation'],
        middlecity: args['middlecity'],
        time: args['time'],
        date: args['date'],
        passengercount: args['passengercount'],
        droplatitude: args['droplatitude'],
        droplongitude: args['droplongitude'],
        picklatitude: args['picklatitude'],
        picklongitude: args['picklongitude'],
        expence: args['expence'],
      );
    },

    '/vehicleDetailScreen': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return VehicleDetailScreen(
        userModel: args['userModel'],
      );
    },
    '/modelsSelecting': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return ModelsSelecting(
        selectedBrand: args['selectedBrand'],
      );
    },
    '/publish': (context) => PickLocation(),
    // '/publish': (context) => KeralaLocationsDemo(),
    '/dropLocation': (context) =>  DropkeralaLocation(),
    // '/dropLocation': (context) => DropkeralaLocation(),
    '/addCity': (context) => const AddCity(),
    // '/cityAddMap': (context) => const CityAddMap(),
    '/cityAddMap': (context) => MultiLocation(),
    '/calendarPage': (context) => const CalendarPage(),
    '/timePickerPage': (context) => const TimePickerPage(),
    '/passengerCount': (context) => const PassengerCount(),
    '/publisConfirm': (context) => const PublisConfirm(),
    '/successPublish': (context) => const SuccessPublish(),
    '/locationPickerPage': (context) => const LocationPickerPage(),

    '/calculateMileageScreen': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return CalculateMileageScreen(
        p_lati: p_lati,
        p_lang: p_lang,
        d_lang: d_lang,
        d_lati: d_lati,
      );
    },
    // '/scanner': (context) =>  Scanner()

    '/userNameEditing': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return UserNameEditing(
        userModel: args['userModel'],
      );
    },
    '/userDobEditing': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return UserDobEditing(
        userModel: args['userModel'],
      );
    },
    '/userNumberEditing': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return UserNumberEditing(
        userModel: args['userModel'],
      );
    },
    '/userEmailEditing': (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return UserEmailEditing(
        userModel: args['userModel'],
      );
    },
  };
}
