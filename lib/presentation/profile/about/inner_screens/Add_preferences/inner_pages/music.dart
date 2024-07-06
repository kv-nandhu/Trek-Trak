import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
String _selectedSong = '';

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
                    Navigator.pushReplacementNamed(context, '/addPreference');
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
                'Music',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.music_note_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'It\'s all about the playlist.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
              Radio<String>(
                  value: 'It\'s all about the playlist.',
                  groupValue: _selectedSong,
                  onChanged: (value) {
                    setState(() {
                      _selectedSong = value!;
                    });
                    },
                    activeColor: Colors.blue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return CustomColor.greenColor();
                      }
                      return CustomColor.greyColor();
                    }),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.music_note_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'I\'ll jam depending on the mood.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Radio<String>(
                  value: 'I\'ll jam depending on the mood.',
                  groupValue: _selectedSong,
                  onChanged: (value) {
                    setState(() {
                      _selectedSong = value!;
                    });
                    },
                    activeColor: Colors.blue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return CustomColor.greenColor();
                      }
                      return CustomColor.greyColor();
                    }),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.music_note_outlined,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Silence is golden.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                   Radio<String>(
                  value: 'Silence is golden.',
                  groupValue: _selectedSong,
                  onChanged: (value) {
                    setState(() {
                      _selectedSong = value!;
                    });
                    },
                    activeColor: Colors.blue,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return CustomColor.greenColor();
                      }
                      return CustomColor.greyColor();
                    }),
                  )
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                     profileBloc.add(SongEvent(song: _selectedSong));
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
