import 'package:flutter/material.dart';
import 'package:n_eventify/views/bottom_navigation_bar.dart';
import 'package:n_eventify/views/splash_page.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import 'authentication.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return SplashPage();
    }
    else {
      return BottomNavigationWidget();
    }
  }
}
