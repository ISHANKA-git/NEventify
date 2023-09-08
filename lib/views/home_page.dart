import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int index = 1;

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  "What's Going \non today",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 80,
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset("assets/homePage/notificationicon.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.menu,
                    size: 40,
                    color: Color.fromARGB(255, 52, 227, 58),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth * .7,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 226, 245, 225),
                      hintText: 'what do you want to discover',
                      prefixIcon: IconButton(
                        alignment: Alignment.centerRight,
                        iconSize: 30,
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/homePage/searchicon.png',
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: _searchController,
                  ),
                ),
                SizedBox(
                  width: screenwidth * .04,
                ),
                Image.asset(
                  'assets/homePage/filtericon.png',
                  height: 60,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/homePage/multiculti.png',
                      width: screenwidth * .25,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/homePage/p1.png',
                          width: screenwidth * .06,
                        ),
                        Image.asset(
                          'assets/homePage/p2.png',
                          width: screenwidth * .06,
                        ),
                        Image.asset(
                          'assets/homePage/p3.png',
                          width: screenwidth * .06,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: screenwidth * .05,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: screenwidth * .23),
                      child: const Text(
                        'NSBM Inaguration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenwidth * .4),
                      child: const Text(
                        '17 July 2023',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                        "Join us in celebrating the momentous\noccasion of the NSBM Department of\nComputer Science and Software\nEngineering's Circle grand inauguration!"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Upcoming Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: screenwidth * .3,
                ),
                const Text(
                  'View More',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenwidth * 0.3,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/homePage/multiculti.png',
                        width: screenwidth * .2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Multi Culti",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '27-07-2023',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenwidth * .15,
                ),
                Container(
                  width: screenwidth * .3,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/homePage/greenbase.png',
                        width: screenwidth * .2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Green Base",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Coming Soon',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Popular Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: screenwidth * .3,
                ),
                const Text(
                  'View More',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(right: screenwidth * .2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/homePage/greenn.png",
                      width: screenwidth * .25,
                    ),
                    SizedBox(
                      width: screenwidth * .05,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Green Noodle',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '14-06-2023',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
