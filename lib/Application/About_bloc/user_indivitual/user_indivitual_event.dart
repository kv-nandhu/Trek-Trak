part of 'user_indivitual_bloc.dart';


 class UserIndivitualEvent {}

class UserUidEvent extends UserIndivitualEvent{

  String uid;
  UserUidEvent({required this.uid});
}