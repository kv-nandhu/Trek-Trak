import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';

class ColorListScreen extends StatefulWidget {
  @override
  _ColorListScreenState createState() => _ColorListScreenState();
}

class _ColorListScreenState extends State<ColorListScreen> {
  final List<Map<String, dynamic>> colors = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Orange', 'color': Colors.orange},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Pink', 'color': Colors.pink},
    {'name': 'Brown', 'color': Colors.brown},
    {'name': 'Grey', 'color': Colors.grey},
    {'name': 'Black', 'color': Colors.black},
    {'name': 'White', 'color': Colors.white},
    {'name': 'Cyan', 'color': Colors.cyan},
    {'name': 'Indigo', 'color': Colors.indigo},
    {'name': 'Lime', 'color': Colors.lime},
    {'name': 'Teal', 'color': Colors.teal},
    {'name': 'Amber', 'color': Colors.amber},
    {'name': 'Deep Orange', 'color': Colors.deepOrange},
    {'name': 'Deep Purple', 'color': Colors.deepPurple},
    {'name': 'Light Blue', 'color': Colors.lightBlue},
    {'name': 'Light Green', 'color': Colors.lightGreen},
    {'name': 'Yellow Accent', 'color': Colors.yellowAccent},
    {'name': 'Pink Accent', 'color': Colors.pinkAccent},
    {'name': 'Blue Grey', 'color': Colors.blueGrey},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color List'),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: colors[index]['color'],
            ),
            title: Text(colors[index]['name']),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
                           context.read<ProfileBloc>().add(VehicleColorEvent(vcolor: colors[index]['name']));
                            Navigator.pushReplacementNamed(context, '/mybottom');
            },
          );
        },
      ),
    );
  }
}