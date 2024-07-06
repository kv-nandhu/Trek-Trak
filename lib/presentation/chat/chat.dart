import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/chat/chat_screen.dart';

class ChatListPage extends StatelessWidget {
  final List<String> chatList = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    // Add more chat names or IDs as needed
  ];

  // Mock user images (you can replace with actual user images)
  final List<String> userImages = [
    "https://via.placeholder.com/150", // Sample image URL
    "https://via.placeholder.com/150", // Sample image URL
    "https://via.placeholder.com/150", // Sample image URL
    "https://via.placeholder.com/150", // Sample image URL
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat History'),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(userImages[index]),
              ),
              title: Text(chatList[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(chatName: chatList[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
