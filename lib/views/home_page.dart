import 'package:flutter/material.dart';
import 'package:n_eventify/views/popular_events.dart';
import 'package:n_eventify/views/upcoming_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  Stream<QuerySnapshot> getEventsStream() {
    return FirebaseFirestore.instance.collection('events').snapshots();
  }

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
          Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 18,
                child: SizedBox(
                  width: screenwidth * .9,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: screenwidth * .6,
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "What's Going\non Today",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: screenwidth * .15,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  "assets/homePage/notificationicon.png",
                                  scale: 4,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: screenwidth * .15,
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: screenwidth * .7,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                  const Color.fromARGB(255, 226, 245, 225),
                                  hintText: 'what do you want to discover',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  prefixIcon: IconButton(
                                    alignment: Alignment.centerRight,
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/homePage/searchicon.png',
                                      width: 20,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                controller: _searchController,
                              ),
                            ),
                            SizedBox(
                              width: screenwidth * .2,
                              height: 50,
                              child: Image.asset("assets/homePage/filtericon.png"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.amber,
                              width: screenwidth * .05,
                            ),
                            SizedBox(
                              width: screenwidth * .2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: screenwidth * .2,
                                    child: Image.asset(
                                      "assets/homePage/ceremony.png",
                                      width: screenwidth * .2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: screenwidth * .2,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/homePage/p1.png",
                                          width: screenwidth * .065,
                                        ),
                                        Image.asset(
                                          "assets/homePage/p2.png",
                                          width: screenwidth * .07,
                                        ),
                                        Image.asset(
                                          "assets/homePage/p3.png",
                                          width: screenwidth * .065,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: screenwidth * .05,
                            ),
                            SizedBox(
                              width: screenwidth * .55,
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "NSBM Inauguration",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(bottom: 4, top: 4),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "23 July 2023",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Join us in celebrating the momentous\noccasion of the NSBM Department of\nComputer Science and Software\nEngineering's Circle grand inauguration!",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: screenwidth * .05,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenwidth * .45,
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Upcoming Events",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth * .45,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const UpcomingEvents()),
                                    );
                                  },
                                  child: const Text(
                                    "View More",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.green),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: screenwidth * .05,
                            ),
                            SizedBox(
                              width: screenwidth * .3,
                              child: Column(
                                children: [
                                  Image.asset("assets/homePage/multiculti.png"),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4, bottom: 4),
                                    child: Text(
                                      "Multi Culti",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Text(
                                    "27 July 2023",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: screenwidth * .2,
                            ),
                            SizedBox(
                              width: screenwidth * .3,
                              child: Column(
                                children: [
                                  Image.asset("assets/homePage/greenbase.png"),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4, bottom: 4),
                                    child: Text(
                                      "Green Base",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: screenwidth * .05,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenwidth * .45,
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Popular Events",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenwidth * .45,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const PopularEvents()),
                                      );
                                    },
                                    child: const Text(
                                      "View More",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.green),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ), // Stream builder
                        SizedBox(
                          width: screenwidth, // Make it the full width of the screen
                          child: Center(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: getEventsStream(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }
                                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                  return Text('No events available.');
                                }

                                List<Widget> eventWidgets = [];

                                for (int i = 0; i < snapshot.data!.docs.length; i += 2) {
                                  Map<String, dynamic> eventData1 =
                                  snapshot.data!.docs[i].data() as Map<String, dynamic>;
                                  String eventName1 = eventData1['eventName'] ?? 'No Name';
                                  String date1 = eventData1['date'] ?? 'No Date';
                                  String imagePath1 = eventData1['imagePath1'] ?? '';

                                  Widget eventWidget1 = _buildEventCard(
                                    screenwidth,
                                    imagePath1,
                                    eventName1,
                                    date1,
                                  );

                                  Widget eventWidget2 = SizedBox(); // Empty widget as a placeholder

                                  if (i + 1 < snapshot.data!.docs.length) {
                                    Map<String, dynamic> eventData2 =
                                    snapshot.data!.docs[i + 1].data() as Map<String, dynamic>;
                                    String eventName2 = eventData2['eventName'] ?? 'No Name';
                                    String date2 = eventData2['date'] ?? 'No Date';
                                    String imagePath2 = eventData2['imagePath1'] ?? '';

                                    eventWidget2 = _buildEventCard(
                                      screenwidth,
                                      imagePath2,
                                      eventName2,
                                      date2,
                                    );
                                  }

                                  eventWidgets.addAll([
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(child: eventWidget1),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Center(child: eventWidget2),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ]);
                                }

                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    children: eventWidgets,
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

Widget _buildEventCard(double screenwidth, String imagePath, String eventName, String date) {
  return Expanded(
    flex: 1,
    child: SizedBox(
      width: screenwidth * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath.isNotEmpty)
            Image.network(
              imagePath,
              width: screenwidth * 0.4,
              height: screenwidth * 0.4,
              fit: BoxFit.cover,
            )
          else
            SizedBox(
              width: screenwidth * 0.4,
              height: screenwidth * 0.4,
            ),
          Text(
            eventName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    ),
  );
}
