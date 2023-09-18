import 'package:flutter/material.dart';
import 'package:n_eventify/views/popular_events.dart';
import 'package:n_eventify/views/upcoming_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

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
          // Wrap the SingleChildScrollView with a Flex widget
          Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 18,
                child: SizedBox(
                  width: screenwidth * .9,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(), // Add this line
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
                                      fontWeight: FontWeight.bold),
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
                              child:
                                  Image.asset("assets/homePage/filtericon.png"),
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
                                  )),
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
                        ),
                        Row(
                          children: [
                            Container(
                              width: screenwidth * .05,
                            ),
                            SizedBox(
                              width: screenwidth * .3,
                              child: Image.asset("assets/homePage/greenn.png"),
                            ),
                            SizedBox(
                              width: screenwidth * .3,
                              child: const Column(
                                children: [
                                  Text(
                                    "Green Noodle",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "07 May 2023",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
