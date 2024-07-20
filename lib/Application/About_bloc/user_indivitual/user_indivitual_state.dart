part of 'user_indivitual_bloc.dart';


sealed class UserIndivitualState {}

final class UserIndivitualInitial extends UserIndivitualState {}

class UsesrInduvitualLoadingState extends UserIndivitualState{}

class UserInduvitualLoadState extends UserIndivitualState {
  UserModel user;
  UserInduvitualLoadState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}