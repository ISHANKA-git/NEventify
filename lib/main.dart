import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_eventify/controller/auth.dart';
import 'package:n_eventify/controller/wrapper.dart';
import 'package:n_eventify/model/user_model.dart';
import 'package:n_eventify/views/bottom_navigation_bar.dart';
import 'package:n_eventify/views/login_signup.dart';
import 'package:n_eventify/views/home_page.dart';
import 'package:n_eventify/views/onboarding_screen.dart';
import 'package:n_eventify/views/event_creation_page.dart';
import 'package:n_eventify/views/splash_page.dart';
import 'package:n_eventify/views/chat_list_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
    return StreamProvider<UserModel?>.value(
        initialData: UserModel(uid: ""),
        value: AuthServices().user,
        child : MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        ),
    );
  }
}
