import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/chat/chat_screen.dart';

Widget thirdSessionAccept({
  String? uname,
  String? userImage,
  required BuildContext context,
  String? userid,
  String? requestUserId, 
  String? userName,
   String? image,
}) {
  print("=======================================================================================================");
  print(userName);
  print(uname);
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatsScreen(
            recieverName: userName ?? 'Unknown User',
            recieverImage: userImage ?? '',
            user1Uid: requestUserId!,
            user2Uid: userid!,
             senderImage: image!, 
             senderName: uname!,
          ),
        ),
      );
    },
    child: Text('Chat with ${userName ?? 'User'}'),
  );
}
