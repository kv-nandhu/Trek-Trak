// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/bottomNavigationBar/bottom_navigation_bar_bloc.dart';
import 'package:trek_trak/presentation/chat/chat.dart';
import 'package:trek_trak/presentation/home/home.dart';
import 'package:trek_trak/presentation/profile/profile.dart';
import 'package:trek_trak/presentation/publish/profile.dart';
import 'package:trek_trak/presentation/ride/ride.dart';
import 'package:trek_trak/utils/color/color.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline_sharp), label: 'Publish'),
  BottomNavigationBarItem(
      icon: Icon(Icons.history_toggle_off), label: 'Your Ride'),
  BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline_outlined), label: 'Chat'),
  BottomNavigationBarItem(
      icon: Icon(Icons.person_3_outlined), label: 'Profile'),
];

List<Widget> bottomNavScreen = <Widget>[
  const HomeScreen(),
  PublishPage(),
  RidePage(),
  ChatPage(),
  const ProfilePage(),
];

class MyBottom extends StatelessWidget {
  const MyBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomNavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: CustomColor.greenColor(),
            unselectedItemColor: CustomColor.blackColor(),
            // type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              BlocProvider.of<BottomNavigationBarBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
