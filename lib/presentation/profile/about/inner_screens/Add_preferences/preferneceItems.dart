// preference_item.dart
import 'package:flutter/material.dart';
import 'package:trek_trak/utils/color/color.dart';

class PreferenceItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const PreferenceItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: CustomColor.greyColor()),
          const SizedBox(width: 20),
          Text(text),
        ],
      ),
    );
  }
}
