import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 18,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: screenwidth * .2,
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back_rounded,
                              size: 30,
                            )),
                      ),
                    ),
                    Container(
                      width: screenwidth * .7,
                      child: const Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
