import 'dart:async';
import 'package:flutter/material.dart';
import 'package:n_eventify/views/onboarding_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  static const splashDuration = Duration(seconds: 7);
  bool isLoading = true;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create a pulsating animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);


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

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => OnBoardingScreen(),
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
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/logo_withname.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 100,
                height: 5,
                color: Color(0xff15BE77),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
