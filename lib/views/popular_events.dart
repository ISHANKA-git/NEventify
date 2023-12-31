import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PopularEvents extends StatefulWidget {
  const PopularEvents({super.key});

  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  final CollectionReference _popular_events =
      FirebaseFirestore.instance.collection("popular_events");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Events"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00BF63),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: StreamBuilder(
                stream: _popular_events.snapshots(),
                builder: (context, AsyncSnapshot snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                  if (snapshots.hasData) {
                    return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, Index) {
                          final DocumentSnapshot records =
                              snapshots.data!.docs[Index];
                          final String imageUrl = records["image"];
                          return Container(
                            child: ListTile(
                              title: Text(records["clubName"]),
                              subtitle: Text(records["date"]),
                              leading: Image.network(
                                imageUrl,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          );
                        });
                  } else {}
                  return const Center(
                    child: Text("There is no data"),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
