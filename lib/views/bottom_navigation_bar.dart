import 'package:flutter/material.dart';
import 'package:n_eventify/views/event_creation_page.dart';
import 'package:n_eventify/views/home_page.dart';

import 'chat_list_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0; // Initially selected tab index

  // List of pages to display for each tab
  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    EventCreationPage(),
    ChatListScreen(),



  ];

  // Handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color(0xFF00BF63),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            backgroundColor: Color(0xFF00BF63),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            backgroundColor: Color(0xFF00BF63),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Color(0xFF00BF63),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Color(0xFF00BF63),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Current selected tab index
        onTap: _onItemTapped, // Function to handle tab selection
      ),
    );
  }
}
