import 'package:flutter/material.dart';


// class ChatPage extends StatelessWidget {
//   const ChatPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat Page'),
//       ),
//       body: const Center(
//         child: Text('This is the Chat Page'),
//       ),
//     );
//   }
// }







class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 239, 241),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 245, 245, 245),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {
                      // Action for bell icon
                    },
                  ),
                ],
              ),
            ),
            // Add the rest of your body here
          ],
        ),
      ),
    );
  }
}
