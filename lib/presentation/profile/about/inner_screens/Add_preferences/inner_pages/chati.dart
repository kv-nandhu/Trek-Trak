import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChattinessScreen extends StatefulWidget {
  const ChattinessScreen({super.key});

  @override
  State<ChattinessScreen> createState() => _ChattinessScreenState();
}

class _ChattinessScreenState extends State<ChattinessScreen> {
  String _selectedChatness = '';

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text(
                    "Back",
                    style: TextStyle(
                        color: CustomColor.greenColor(), fontSize: 15),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.greenColor(),
                    size: 15,
                  ),
                ),
              ),
              const Text(
                'Chattiness',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.message,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I love to chat',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value: 'I love to chat',
                    groupValue: _selectedChatness,
                    onChanged: (value) {
                      setState(() {
                        _selectedChatness = value!;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return CustomColor.greenColor();
                        }
                        return CustomColor.greyColor();
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.message,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I\'m chatty when I feel comfortable',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value: 'I\'m chatty when I feel comfortable',
                    groupValue: _selectedChatness,
                    onChanged: (value) {
                      setState(() {
                        _selectedChatness = value!;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return CustomColor.greenColor();
                        }
                        return CustomColor.greyColor();
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.message,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I\'m the quiet type',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                    value: 'I\'m the quiet type',
                    groupValue: _selectedChatness,
                    onChanged: (value) {
                      setState(() {
                        _selectedChatness = value!;
                      });
                    },
                    activeColor: Colors.blue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return CustomColor.greenColor();
                        }
                        return Colors.grey;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 300,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    profileBloc.add(ChatnessEvent(chat: _selectedChatness));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully selected'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      color: CustomColor.greenColor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: CustomColor.whiteColor(),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
