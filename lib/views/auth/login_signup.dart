import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Image(
                    image: AssetImage(
                      'assets/logo_withname.png',
                    ),
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement login functionality
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement sign-up functionality
                      },
                      style: ElevatedButton.styleFrom(
                          side: BorderSide.none,
                          elevation: 0,
                          backgroundColor: Colors.white),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',

                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person), // Icon on the left
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Or Continue With',
                  style: TextStyle(
                    fontSize: 11,
                    wordSpacing: 4,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
