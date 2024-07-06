import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/bottomNavigationBar/bottom_navigation_bar_bloc.dart';
import 'package:trek_trak/presentation/chat/chat.dart';
import 'package:trek_trak/presentation/home/home.dart';
import 'package:trek_trak/presentation/profile/profile.dart';
import 'package:trek_trak/presentation/publish/location_picker.dart';
import 'package:trek_trak/presentation/ride/ride.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

List<FlashyTabBarItem> bottomNavItems = <FlashyTabBarItem>[
  FlashyTabBarItem(
    icon: const Icon(Icons.home),
    title: const Text('Home'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.add_circle_outline_sharp),
    title: const Text('Publish'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.history_toggle_off),
    title: const Text('Your Ride'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.chat_bubble_outline_outlined),
    title: const Text('Chat'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.person_3_outlined),
    title: const Text('Profile'),
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  const HomeScreen(),
  const LocationPickerPage(),
  const RidePage(),
  ChatListPage(),
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
          bottomNavigationBar: FlashyTabBar(
            height: 70,
            animationCurve: Curves.linear,
            selectedIndex: state.tabIndex,
            showElevation: true,
            onItemSelected: (index) {
              BlocProvider.of<BottomNavigationBarBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
            items: bottomNavItems,
          ),
        );
      },
    );
  }
}
