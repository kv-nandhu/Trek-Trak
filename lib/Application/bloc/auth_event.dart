part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}



class CheckLoginStatusEvent extends AuthEvent{}



//todo: ------------------>login event<------------
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.password, required this.email});
}

//! --------------->sighnup event<-----------------

class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent({required this.user,});
}
//! --------------->Text event<--------------------
class TextEvent extends AuthEvent {
  final bool obscure;
  TextEvent({required this.obscure});
}
//! --------------->Logout event<------------------
class LogoutEvent extends AuthEvent{}
