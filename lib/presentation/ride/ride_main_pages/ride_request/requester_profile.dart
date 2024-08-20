import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/user_indivitual/user_indivitual_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trek_trak/Application/all_data_getting/data_getting_bloc.dart';
import 'package:trek_trak/Application/request/get_request_ride/get_request_ride_data_bloc.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';

class RequesterProfile extends StatefulWidget {
  final String? name;
  final String? dob;
  final String? gender;
  final String? image;
  final String? number;

  RequesterProfile({
    required this.dob,
    required this.gender,
    required this.image,
    required this.name,
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  State<RequesterProfile> createState() => _RequesterProfileState();
}

class _RequesterProfileState extends State<RequesterProfile> {
  bool _showPreferredChatOptions = false;
  @override
  void initState() {
    super.initState();
    context.read<GetRequestRideDataBloc>().add(FetchRequestRideDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: widget.image != null
                          ? NetworkImage(widget.image!)
                          : null,
                      child: widget.image == null
                          ? const Icon(Icons.person, size: 60)
                          : null,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.name!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.dob} y/o",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
             Text(
                      'Gender: ${widget.gender!}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                     const SizedBox(height: 15),
                     Text(
                      'Number: ${widget.number!}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                     const SizedBox(height: 15),
              
             
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Confirmed email', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Confirmed phone number', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(thickness: 1),
              const SizedBox(height: 16),
           
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showPreferredChatOptions = !_showPreferredChatOptions;
                  });
                },
                child: Text(
                  'Report this member',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDateString(String date) {
    List<String> parts = date.split('-');
    if (parts.length == 3) {
      String year = parts[0];
      String month = parts[1].padLeft(2, '0');
      String day = parts[2].padLeft(2, '0');
      return '$year-$month-$day';
    }
    return date;
  }

  int calculateAge(String dob) {
    DateTime today = DateTime.now();
    try {
      String formattedDob = formatDateString(dob);
      DateTime parsedDate = DateTime.parse(formattedDob);
      int age = today.year - parsedDate.year;
      if (today.month < parsedDate.month ||
          (today.month == parsedDate.month && today.day < parsedDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      print("Error parsing date: $e");
      return 0; // Return 0 or handle the error appropriately
    }
  }
}
