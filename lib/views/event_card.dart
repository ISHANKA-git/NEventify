import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String clubName;
  final String location;
  final String date;
  final int maxEntries;
  final List<String> tags;
  final String startTime;
  final String endTime;
  final String? imagePath;

  EventCard({
    required this.eventName,
    required this.clubName,
    required this.location,
    required this.date,
    required this.maxEntries,
    required this.tags,
    required this.startTime,
    required this.endTime,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          if (imagePath != null)
            Image.network(
              imagePath!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ListTile(
            title: Text(eventName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Club: $clubName"),
                Text("Location: $location"),
                Text("Date: $date"),
                Text("Max Entries: $maxEntries"),
                Text("Tags: ${tags.join(', ')}"),
                Text("Start Time: $startTime"),
                Text("End Time: $endTime"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
