part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarEvent {}

class TabChange extends BottomNavigationBarEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
