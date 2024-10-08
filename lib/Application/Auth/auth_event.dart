// ignore_for_file: camel_case_types, must_be_immutable

part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

//todo: ------------------>login event<------------
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.password, required this.email});
}

//! --------------->sighnup event<-----------------

class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent({
    required this.user,
  });
}

//! --------------->Text event<--------------------
class TextEvent extends AuthEvent {
  final bool obscure;
  TextEvent({required this.obscure});
}

//! --------------->Logout event<------------------
class LogoutEvent extends AuthEvent {}

class sentotpEvent extends AuthEvent {
  final String number;
  final String email;
  final String name;
  final String gender;
  final BuildContext context;

  sentotpEvent(
      {required this.number,
      required this.email,
      required this.name,
      required this.gender,
      required this.context});

  // @override
  // List<Object> get props => [number, email, name, gender, context];
}

class verificationOtpEvent extends AuthEvent {
  final String otp;
  final String name;
  final String gender;
  final String email;
  final String number;
  final String verificationId;
  final BuildContext context;

  verificationOtpEvent(
      {required this.otp,
      required this.name,
      required this.gender,
      required this.email,
      required this.number,
      required this.verificationId,
      required this.context});

  // @override
  // List<Object> get props => [otp, name, gender, email, number, verificationId, context];
}

class signwithemailandpasswordEvent extends AuthEvent {
   final String name;
  final String gender;
  final String email;
  final String number;
  final String password;
  final String city;
  final String street;
  final String district;
  final String dob;
  final String image;
  final String miniBio;
  final String chat;
  final String song;
  final String smoke;
  final String pet;
  final String vnumber;
  final String vmodel;
  final String vbrand;
  final String vcolor;
  final String vtype;
  // final String address;
  // final String companyAddress;



  final BuildContext context;

  signwithemailandpasswordEvent({
    required this.password,
    required this.name,
    required this.number,
    required this.gender,
    required this.email,
    required this.city,
    required this.street,
    required this.district,
    required this.dob,
    required this.image,
    required this.miniBio,
    required this.chat,
    required this.song,
    required this.smoke,
    required this.pet,
    required this.context,
    required this.vnumber,
    required this.vmodel,
    required this.vbrand,
    required this.vcolor,
    required this.vtype,
    // required this.address,
    // required this.companyAddress,

  });
}

class SignInevent extends AuthEvent {
  final String email;
  final String password;
  BuildContext context;
  SignInevent(
      {required this.email, required this.password, required this.context});
}

class LoggingInitialEvent extends AuthEvent {}
