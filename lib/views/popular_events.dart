import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:n_eventify/views/event_card.dart';

class PopularEvents extends StatelessWidget {
  const PopularEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Events"),
        backgroundColor: Color(0xFF00BF63),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('popular_events').snapshots(),
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
