import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';

Widget FirstSession( {String? time, String? date, String? dropitlocation, String? passengercount, String? expence, String? pickuplocation}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Sat 13 July',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                 Text(time ?? "hai"),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  '6h 20m',
                  style: TextStyle(color: CustomColor.greyColor()),
                ),
                const SizedBox(
                  height: 25,
                ),
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
                  '${pickuplocation},\n'
                  
               
                ),
                Row(
                  children: [
                    const Icon(
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
                  '${dropitlocation},\n'
           
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
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Total price for $passengercount \n passenger',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Text(
              '₹ $expence',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      const divider_width_big(),
    ],
  );
}
