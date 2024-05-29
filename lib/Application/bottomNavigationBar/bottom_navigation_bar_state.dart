part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarState {
  final int tabIndex;

  const BottomNavigationBarState({required this.tabIndex});
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
  const BottomNavigationBarInitial({required super.tabIndex});
  
}
