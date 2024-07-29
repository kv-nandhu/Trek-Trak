import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/utils/color/color.dart';
import 'package:trek_trak/utils/divider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_whatsapp/share_whatsapp.dart';

Widget thirdSession({
  required String detailsPageLink,
  required String time,
  required String date,
  required String dropitlocation,
  required String passengercount,
  required String expence,
  required String pickuplocation,
  required UserModel usermodel,
}) {
  String detailsText =
      'Will take Blr-Mysore road expy and will enter TN via thimbam forest. '
      'AC conditioned throughout the journey. Ample legroom and boot space.\n\n'
      'Contact Victor: ${usermodel.number!}\n\n'
      'Vehicle Brand: ${usermodel.vbrand!}\n'
      'Vehicle Color: ${usermodel.vcolor!}\n\n'
      'Date: $date\n'
      'Time: $time\n'
      'Drop-off Location: $dropitlocation\n'
      'Passenger Count: $passengercount\n'
      'Expense: $expence\n'
      'Pick-up Location: $pickuplocation\n\n'
      'For more details, visit: $detailsPageLink';
print(usermodel.number);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailsText,
            ),
            const SizedBox(height: 17),
            InkWell(
              onTap: () {
                _makePhoneCall(usermodel.number!);
                // _testUrlSchemes();
              },
              child:  Text(
                'Contact ${usermodel.name}',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            const SizedBox(height: 17),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "Your booking will be confirmed \n instantly",
            ),
            const SizedBox(height: 10),
            const Text('Max. 2 in the back'),
            const SizedBox(height: 10),
            Text(
              usermodel.vbrand!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(usermodel.vcolor!),
          ],
        ),
      ),
      const divider_width_big(),
      const SizedBox(height: 5),
      Align(
        alignment: Alignment.bottomLeft,
        child: TextButton.icon(
          onPressed: () {
            shareToWhatsApp(detailsText);
          },
          icon: Icon(
            Icons.share,
            color: CustomColor.greenColor(),
            size: 25,
          ),
          label: Text(
            'Share',
            style: TextStyle(
              color: CustomColor.greenColor(),
              fontSize: 20,
            ),
          ),
        ),
      ),
    ],
  );
}

void shareToWhatsApp(String detailsText) async {
  ShareWhatsapp shareWhatsapp = ShareWhatsapp();

  // Share the text message to WhatsApp
  bool shared = await shareWhatsapp.share(
    type: WhatsApp.standard,
    text: detailsText,
  );

  if (shared) {
    print('Shared successfully to WhatsApp!');
  } else {
    print('Failed to share to WhatsApp.');
  }
}

void _makePhoneCall(String phoneNumber) async {
  phoneNumber = phoneNumber.replaceAll(' ', ''); // Remove spaces if any
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  try {
    final bool canLaunchResult = await canLaunchUrl(phoneUri);
    if (canLaunchResult) {
      await launchUrl(phoneUri);
      print('Launching $phoneUri');
    } else {
      print('Cannot launch $phoneUri');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// void _makePhoneCall(String phoneNumber) async {
//     final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
//     // ignore: deprecated_member_use
//     if (await canLaunch(phoneUri.toString())) {
//       // ignore: deprecated_member_use
//       await launch(phoneUri.toString());
//     } else {
//       throw 'Could not launch $phoneUri';
//     }
//   }
void _testUrlSchemes() async {
  final Uri testUri = Uri(
    scheme: 'https',
    path: 'www.google.com',
  );

  try {
    final bool canLaunchResult = await canLaunchUrl(testUri);
    if (canLaunchResult) {
      await launchUrl(testUri);
      print('Launching $testUri');
    } else {
      print('Cannot launch $testUri');
    }
  } catch (e) {
    print('Error: $e');
  }
}


