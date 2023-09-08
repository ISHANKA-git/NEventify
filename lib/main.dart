import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_eventify/views/bottom_navigation_bar.dart';
import 'package:n_eventify/views/login_signup.dart';
import 'package:n_eventify/views/home_page.dart';
import 'package:n_eventify/views/onboarding_screen.dart';
import 'package:n_eventify/views/event_creation_page.dart';
import 'package:n_eventify/views/splash_page.dart';
import 'package:n_eventify/views/chat_list_screen.dart';

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
      home: BottomNavigationWidget(),
    );
  }
}
