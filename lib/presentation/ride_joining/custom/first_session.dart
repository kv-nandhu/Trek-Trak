import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

Widget FirstSession({
  String? time,
  String? date,
  String? dropitlocation,
  String? passengercount,
  String? expence,
  String? pickuplocation,
}) {
  String formattedDate = '';
  if (date != null) {
    try {
      DateFormat inputFormat = DateFormat('dd-MM-yyyy');
      DateTime parsedDate = inputFormat.parse(date);
      DateFormat outputFormat = DateFormat('d MMMM yyyy');
      formattedDate = outputFormat.format(parsedDate);
    } catch (e) {
      formattedDate = 'Invalid date format';
    }
  } else {
    formattedDate = 'No date provided';
  }
  int passengerCount = int.tryParse(passengercount ?? '0') ?? 0;
  int totalSeats = passengerCount; // Assume total seats is same as passenger count

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          formattedDate,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time ?? "No time provided"),
                const SizedBox(height: 25),
                Text(
                  '6h 20m',
                  style: TextStyle(color: CustomColor.greyColor()),
                ),
                const SizedBox(height: 25),
                const Text('10:10'),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: CustomColor.greenColor(),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                  height: 150.0,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: LinearProgressIndicator(
                      backgroundColor: CustomColor.greyColor(),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
                      value: 0.6,
                    ),
                  ),
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: CustomColor.greenColor(),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${pickuplocation ?? 'No pick-up location provided'},\n',
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.directions_walk_outlined,
                      color: Colors.yellow,
                    ),
                    Text(
                      '7 km from your departure',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
                Text(
                  '${dropitlocation ?? 'No drop-off location provided'},\n',
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.directions_walk_outlined,
                      color: Colors.green,
                    ),
                    Text(
                      '38 km from your arrival',
                      style: TextStyle(color: CustomColor.greenColor()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const divider_width_big(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Seats (${passengerCount} available)',
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Text(
              '₹ ${expence ?? '0'}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(totalSeats, (index) {
            bool isBooked = index < passengerCount;
            return Icon(
              Icons.event_seat,
              color: isBooked ? Colors.red : Colors.green,
              size: 24.0,
            );
          }),
        ),
      ),
      const divider_width_big(),
    ],
  );
}
