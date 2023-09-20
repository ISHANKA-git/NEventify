import 'package:flutter/material.dart';
import 'event_card.dart'; // Import the EventCard widget
import 'package:cloud_firestore/cloud_firestore.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        backgroundColor: Color(0xFF00BF63),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final event = documents[index].data() as Map<String, dynamic>;
              return EventCard(
                eventName: event['eventName'],
                clubName: event['clubName'],
                location: event['location'],
                date: event['date'],
                maxEntries: event['maxEntries'],
                tags: List<String>.from(event['tags']),
                startTime: event['startTime'],
                endTime: event['endTime'],
                imagePath: event['imagePath'],
              );
            },
          );
        },
      ),
    );
  }
}
