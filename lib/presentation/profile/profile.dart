import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/profile/about/about.dart';
import 'package:trek_trak/presentation/profile/account/account.dart';
import 'package:trek_trak/utils/color/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  icon() => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColor.whiteColor(),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(child: Text('About you')),
              Tab(child: Text('Account'))
            ]),
          ),
          body: const TabBarView(
            children: [
              AboutScreen(),
              AccountScreen(),
            ],
          )),
    );
  }
}
