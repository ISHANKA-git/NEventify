import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:n_eventify/views/bottom_navigation_bar.dart';
import 'package:n_eventify/views/home_page.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({super.key});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventState();
}

class _UpcomingEventState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFC8E6C9), // Green background color for the icon
              shape: BoxShape.circle, // Rounded shape
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp, color: Color(0xFF00BF63)),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Navigate back to the previous page
              },
            ),
          ),
        ),
        title: Text('Upcoming Events',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),), // Add the title here
      ),
    );
  }
}
