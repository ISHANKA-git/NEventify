import 'dart:async';
import 'package:flutter/material.dart';
import 'package:n_eventify/views/onboarding_screen.dart'; // Import your onboarding screen file

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  static const splashDuration = Duration(seconds: 7); // Set the splash screen duration to 7 seconds
  bool isLoading = true;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create a pulsating animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust the duration as needed
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);

    // Start a timer to navigate to the onboarding screen after splashDuration
    Timer(splashDuration, () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        _navigateToOnboardingScreen();
      }
    });
  }

  _navigateToOnboardingScreen() {
    // After the delay, navigate to the onboarding screen.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => OnBoardingScreen(), // Navigate to the OnBoardingScreen.
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff15BE77)),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              child: Image.asset(
                'assets/logo_withname.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16), // Add spacing between image and effect
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 100, // Adjust the width as needed
                height: 5, // Adjust the height as needed
                color: Color(0xff15BE77), // Your custom color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
