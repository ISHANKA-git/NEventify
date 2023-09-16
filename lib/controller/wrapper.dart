import 'package:flutter/material.dart';
import 'package:n_eventify/views/splash_page.dart';

import 'authentication.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
