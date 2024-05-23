// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class AuthLoading extends AuthState{
  @override
  List<Object> get props => [];
}


class Authenticated extends AuthState{

  User? user;

  Authenticated(this.user);
}


class UnAuthenticated extends AuthState{
  @override
  List<Object> get props => [];
}


class AuthenticatedError extends AuthState{


  final String message;

  AuthenticatedError({required this.message});
}

class TextState extends AuthState {
  final bool obscure;
  TextState({
    required this.obscure,
  });
  
}
