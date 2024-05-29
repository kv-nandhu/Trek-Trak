import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek_trak/Application/bottomNavigationBar/bottom_navigation_bar_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
  BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline_sharp), label: 'Publish'),
  BottomNavigationBarItem(
      icon: Icon(Icons.history_toggle_off), label: 'Your Ride'),
  BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline_outlined), label: 'Chat'),
  BottomNavigationBarItem(
      icon: Icon(Icons.person_3_outlined), label: 'Profile'),
];

const List<Widget> bottomNavScreen = <Widget>[
  Text('Index 0: Home'),
  Text('Index 1: Publish'),
  Text('Index 2: Your Ride'),
  Text('Index 3: Chat'),
  Text('Index 4: Profile'),
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
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: CustomColor.greenColor(),
            unselectedItemColor: CustomColor.blackColor(),
            // type: BottomNavigationBarType.shifting,
               backgroundColor: Colors.transparent,
       
          showUnselectedLabels: true,
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
