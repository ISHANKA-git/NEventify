import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF00BF63),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Chat',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen(senderName: 'Nilakshida Silva', imageUrl: 'images/Photo Profile.png')),
                    );
                  },
                  child: ChatBox(
                    imageUrl: 'images/Photo Profile.png',
                    senderName: 'Nilakshida Silva',
                    lastMessage: 'Hey, how are you?',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen(senderName: 'Kusal Mendis', imageUrl: 'images/Photo Profile (1).png')),
                    );
                  },
                  child: ChatBox(
                    imageUrl: 'images/Photo Profile (1).png',
                    senderName: 'Kusal Mendis',
                    lastMessage: 'Sure thing!',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen(senderName: 'Nishad Jayalath', imageUrl: 'images/Photo Profile (2).png')),
                    );
                  },
                  child: ChatBox(
                    imageUrl: 'images/Photo Profile (2).png',
                    senderName: 'Nishad Jayalath',
                    lastMessage: 'Good morning!',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  final String imageUrl;
  final String senderName;
  final String lastMessage;

  ChatBox({required this.imageUrl, required this.senderName, required this.lastMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 25,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                senderName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                lastMessage,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
