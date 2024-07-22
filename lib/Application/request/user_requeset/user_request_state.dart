// Application/user_request/user_request_state.dart
part of 'user_request_bloc.dart';

 class UserRequestState {}

class UserRequestInitial extends UserRequestState {}

class RequestLoadingState extends UserRequestState {}

class RequestAddingSuccessState extends UserRequestState {}

class RequestErrorState extends UserRequestState {
  final String error;

  RequestErrorState({required this.error});
}
