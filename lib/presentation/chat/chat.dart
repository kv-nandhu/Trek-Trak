import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trek_trak/Application/chats/bloc/chat_room_bloc.dart';
import 'package:trek_trak/infrastructure/chat/chat.dart';
import 'package:trek_trak/presentation/chat/chat_screen.dart';
import 'package:trek_trak/presentation/chat/display_message.dart';
import 'package:trek_trak/utils/custom_send.dart';
import 'package:trek_trak/utils/themedata.dart';

class ChatRoomListScreen extends StatefulWidget {
  const ChatRoomListScreen({super.key});

  @override
  State<ChatRoomListScreen> createState() => _ChatRoomListScreenState();
}

class _ChatRoomListScreenState extends State<ChatRoomListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatRoomBloc>().add(getChatListEvent(search: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 229, 229),
      appBar: AppBar(
        title: Text(
          'Messaging',
          style: GoogleFonts.aBeeZee(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(10, 29),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CupertinoSearchTextField(
              onChanged: (value) {
                context
                    .read<ChatRoomBloc>()
                    .add(getChatListEvent(search: value));
              },
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ChatRoomBloc, ChatRoomState>(
            builder: (context, state) {
              if (state is ChatLaodingState) {
                return const Center(
                  child: Center(child: CircularProgressIndicator(),),
                );
              } else if (state is ChatLoadedState) {
                if (state.ChatList.isEmpty) {
                  return const Center(
                    child: Text('Looks Empty. No upcoming trips available'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.ChatList.length,
                    itemBuilder: (context, index) {
                      final String? currentUid =
                          FirebaseAuth.instance.currentUser?.uid;

                      if (currentUid == null) {
                        return const SizedBox(
                          child: Text("id is not get"),
                        );
                      }
                      return StreamBuilder<DocumentSnapshot?>(
                        stream: 
                        MessageRepo().getLasMessage(
                            currentUid, state.ChatList[index].uid ?? ''),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const custom_chstList(),
                                const SizedBox(
                                  width: 20,
                                ),
                                custom_skel(heiht: 20, width: 40)
                              ],
                            );
                          }
                          print("currentUid");
                          print(currentUid);
                          print(state.ChatList[index].uid);
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (!snapshot.hasData || snapshot.data == null) {
                          }

                          Map<String, dynamic>? chatRoomData =
                              snapshot.data?.data() as Map<String, dynamic>?;

                          if (chatRoomData == null) {
                            return const Text('Chat room data is null');
                          }

                          String? lastMessage = chatRoomData['last_msg'] as String?;
                          bool isCurrentUser = chatRoomData['from_id'] == currentUid;
                          Timestamp? lastTime = chatRoomData['last_time'] as Timestamp?;
                          String lastMessageTime = lastTime != null
                              ? DateFormat('HH:mm').format(lastTime.toDate())
                              : '';

                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatsScreen(
                                        recieverName: state.ChatList[index].name ?? '',
                                        recieverImage: state.ChatList[index].image ?? '',
                                        user1Uid: currentUid,
                                        user2Uid: state.ChatList[index].uid ?? '',
                                        senderImage: '', 
                                        senderName: '', 
                                      ),
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  maxRadius: 40,
                                  backgroundImage: NetworkImage(
                                    state.ChatList[index].image ?? '',
                                  ),
                                ),
                                title: Text(state.ChatList[index].name ?? ''),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          height: 30,
                                          child: Text('$lastMessage',
                                              style: ThemeDataColors.roboto(
                                                  colors: isCurrentUser
                                                      ? Colors.white
                                                      : Colors.green,
                                                  fontsize: 17)),
                                        ),
                                      ],
                                    ),
                                    Text(lastMessageTime,
                                        style: ThemeDataColors.roboto(
                                            colors: isCurrentUser
                                                ? Colors.white
                                                : Colors.green,
                                            fontsize: 17)),
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
