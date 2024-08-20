import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/infrastructure/chat/chat.dart';
import 'package:skeleton_text/skeleton_text.dart';


class Custome_send extends StatefulWidget {
  final String recieverName;
  final String recieverImage;
  final String user1Uid;
  final String user2Uid;
  final String senderImage;
  final String senderName;
  Custome_send({
    Key? key,
    required this.recieverName,
    required this.recieverImage,
    required this.user1Uid,
    required this.user2Uid,
    required this.senderImage,
    required this.senderName, required this.userModel,
  }) : super(key: key);
final UserModel userModel;

  @override
  State<Custome_send> createState() => _Custome_sendState();
}

class _Custome_sendState extends State<Custome_send> {
  final TextEditingController messageController = TextEditingController();

  MessageRepo _messageRepo = MessageRepo();
  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await _messageRepo.sendMessage(
          widget.user2Uid, messageController.text, widget.userModel);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 20.0, left: 10, right: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: CupertinoTextField(
              autocorrect: true,
              controller: messageController,
              placeholder: 'Send message',
              cursorColor: Colors.white,
              maxLines: null,
              onChanged: (value) {
                int numLines = (value.length / 40).ceil();
                numLines = numLines == 0 ? 1 : numLines;

                if (messageController.text.isNotEmpty) {
                  setState(() {
                    messageController.text = messageController.text;
                  });
                }
              },
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: BoxDecoration(
                border: Border.all(
                  color: CupertinoColors.white,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                sendMessage();
              },
              child: CircleAvatar(
                maxRadius: 20,
                backgroundImage: NetworkImage(widget.recieverImage
                    ),
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}

class custom_skel extends StatelessWidget {
  custom_skel(
      {this.radius, super.key, required this.heiht, required this.width});
  double heiht;
  double width;
  double? radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SkeletonAnimation(
        child: Container(
          height: heiht,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(radius ?? 20)),
        ),
      ),
    );
  }
}
