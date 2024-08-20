import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/infrastructure/chat/chat.dart';
import 'package:trek_trak/presentation/chat/chat_bubble.dart';
import 'package:trek_trak/utils/custom_send.dart';

// ignore: must_be_immutable
class ChatsScreen extends StatefulWidget {
  final String recieverName;
  final String recieverImage;
  final String user1Uid;
  final String user2Uid;
  final String senderImage;
  final String senderName;

  const ChatsScreen({super.key, 
    required this.recieverName,
    required this.recieverImage,
    required this.user1Uid,
    required this.user2Uid,
    required this.senderImage,
    required this.senderName,
  });

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController messageController = TextEditingController();
  final MessageRepo _messageRepo = MessageRepo();
  List<DateTime> _messageDates = [];

  @override
  void initState() {
    super.initState();
    _markMessagesAsSeen();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  Future<void> _markMessagesAsSeen() async {
    await _messageRepo.markMessagesAsSeen(widget.user1Uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 224, 224),
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: InkWell(
          onTap: () {
            // Handle onTap if necessary
          },
          child: Row(
            children: [
              CircleAvatar(
                maxRadius: 30,
                backgroundImage: NetworkImage(widget.recieverImage),
              ),
              const SizedBox(width: 10),
              Text(widget.recieverName)
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInfo(),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data!.exists) {
          UserModel currentUserModel =
              UserModel.fromJson(snapshot.data!.data() as Map<String, dynamic>);
          return Custome_send(
            recieverName: widget.recieverName,
            recieverImage: widget.recieverImage,
            user1Uid: widget.user1Uid,
            user2Uid: widget.user2Uid,
            senderImage: widget.senderImage,
            senderName: widget.senderName,
            userModel: currentUserModel,
          );
        } else {
          return const Text('User does not exist');
        }
      },
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _messageRepo.getMessage(
          FirebaseAuth.instance.currentUser!.uid, widget.user2Uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final docs = snapshot.data!.docs;
        _messageDates = _getMessageDates(docs);
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final message = docs[index];
            final isLastMessageOfDay = _isLastMessageOfDay(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLastMessageOfDay) _buildDateHeader(message),
                _buildMessageItem(message),
              ],
            );
          },
        );
      },
    );
  }

  List<DateTime> _getMessageDates(List<QueryDocumentSnapshot<Object?>> docs) {
    return docs.map((e) {
      int sendTimeInMillis = e['send_time'];
      return DateTime.fromMillisecondsSinceEpoch(sendTimeInMillis);
    }).toList();
  }

  bool _isLastMessageOfDay(int index) {
    if (index == 0) return true;
    final currentDate = _messageDates[index];
    final previousDate = _messageDates[index - 1];
    return currentDate.day != previousDate.day;
  }

  Widget _buildDateHeader(QueryDocumentSnapshot<Object?> message) {
    int sendTimeInMillis = message['send_time'];
    DateTime sendTime = DateTime.fromMillisecondsSinceEpoch(sendTimeInMillis);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    String formattedDate;

    if (sendTime.year == now.year &&
        sendTime.month == now.month &&
        sendTime.day == now.day) {
      formattedDate = 'Today';
    } else if (sendTime.year == yesterday.year &&
        sendTime.month == yesterday.month &&
        sendTime.day == yesterday.day) {
      formattedDate = 'Yesterday';
    } else {
      formattedDate = DateFormat('dd MMM yyyy').format(sendTime);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            formattedDate,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageItem(QueryDocumentSnapshot<Object?> e) {
    Map<String, dynamic> data = e.data() as Map<String, dynamic>;
    bool isCurrentUser =
        data['send_id'] == FirebaseAuth.instance.currentUser!.uid;
    int sendTimeInMillis = data['send_time'];
    DateTime sendTime = DateTime.fromMillisecondsSinceEpoch(sendTimeInMillis);

    String messageContent = data['messege_content'] ?? 'check 2';
    String period = sendTime.hour < 12 ? 'AM' : 'PM';
    int hour12 = sendTime.hour == 0 ? 12 : sendTime.hour % 12;
    String formattedTime =
        '${hour12.toString().padLeft(2, '0')}:${sendTime.minute.toString().padLeft(2, '0')} $period';

    return ChatBubble(
      messageContent: messageContent,
      isCurrentUser: isCurrentUser,
      isSeen: data['seen_time'],
      formattedTime: formattedTime,
    );
  }
}
