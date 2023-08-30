import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_eventify/views/auth/login_signup.dart';
import 'package:n_eventify/views/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: _buildTheme(Brightness.dark),
      home: OnBoardingScreen(),
    );

  }
}


