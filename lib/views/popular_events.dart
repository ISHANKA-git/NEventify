import 'package:flutter/material.dart';

class PopularEvents extends StatefulWidget {
  const PopularEvents({super.key});

  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Events"),
      ),
    );
  }
}
