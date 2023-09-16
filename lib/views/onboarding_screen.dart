import 'package:flutter/material.dart';
import 'package:n_eventify/controller/wrapper.dart';
import 'package:n_eventify/views/login_signup.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

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
                height: 120,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Image(image: AssetImage('assets/onboard_icon1.png')),
              ),
              const Text(
                'Welcome to NEventify',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90, right: 90),
                child: Text(
                  'Here You Can Find Social Network to Create, Discover, Share & Monetize Events',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    height: 1.5,
                    wordSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){return Login_SignUp();},),);
                },
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    fixedSize: const Size(130, 40),
                    backgroundColor: Colors.white,
                    shadowColor: const Color(0xff15BE77),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: const BorderSide(color: Color(0xff15BE77), width: 1)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xff15BE77),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
