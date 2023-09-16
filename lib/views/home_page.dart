import 'package:flutter/material.dart';

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
      //backgroundColor: const Color.fromARGB(255, 170, 168, 168),
      body: Row(
        children: [
          Container(
            //left side margin
            width: screenwidth * .05,
          ),
          SingleChildScrollView(
            child: Container(
              //body
              color: Colors.white,
              width: screenwidth * .9,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    //1st row sesction
                    children: [
                      const Text(
                        "What's Going \non today",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenwidth * .18,
                      ),
                      SizedBox(
                        child: Image.asset(
                          "assets/homePage/notificationicon.png",
                          width: screenwidth * .1,
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * .05,
                      ),
                      const Icon(
                        Icons.menu,
                        color: Colors.green,
                        size: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    //2nd row section
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: _searchController,
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * .05,
                      ),
                      Image.asset(
                        'assets/homePage/filtericon.png',
                        height: 60,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    //3rd row section
                    children: [
                      Container(
                        width: screenwidth * .05,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/homePage/ceremony.png',
                            width: screenwidth * .2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/homePage/p1.png',
                                width: screenwidth * .063,
                              ),
                              Image.asset(
                                'assets/homePage/p2.png',
                                width: screenwidth * .063,
                              ),
                              Image.asset(
                                'assets/homePage/p3.png',
                                width: screenwidth * .063,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: screenwidth * .05,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NSBM Inaguration',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '17 July 2023',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Join us in celebrating the momentous\noccasion of the NSBM Department of\nComputer Science and Software\nEngineering's Circle grand inauguration!",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenwidth * .05,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    //4th row section
                    children: [
                      const Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenwidth * .35,
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
                    height: 25,
                  ),
                  Row(
                    //5th row section

                    children: [
                      SizedBox(
                        width: screenwidth * .1,
                      ),
                      Column(
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
                      SizedBox(
                        width: screenwidth * .3,
                      ),
                      Column(
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
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Popular Events",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenwidth * .405,
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
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenwidth * .1,
                      ),
                      Image.asset(
                        "assets/homePage/greenn.png",
                        width: screenwidth * .2,
                      ),
                      SizedBox(
                        width: screenwidth * .05,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            //right side margin
            width: screenwidth * .05,
          ),
        ],
      ),
    );
  }
}
