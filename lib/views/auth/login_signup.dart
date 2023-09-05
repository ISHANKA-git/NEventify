import 'package:flutter/material.dart';

class login_SignUp extends StatelessWidget {
  const login_SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(

          body: Column(
              children: [
          // App Logo
          Container(
          padding: EdgeInsets.all(50.0),
          child: Image.asset(
            'assets/logo_withname.png', // Replace with your app logo image
            height: 150.0, // Adjust the height as needed
          ),
        ),
      // Tabs
      Padding(
        padding: const EdgeInsets.symmetric(horizontal : 60.0),
        child: TabBar(
          labelColor: Colors.blueGrey, // Text color when selected
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 18.0,
          fontWeight: FontWeight.bold), // Font size for selected tab
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          indicatorColor: Color(0xFF00BF63), // Underline color
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3.0,
          tabs: [
            Tab(text: 'Login',),
            Tab(text: 'Sign Up'),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          children: [
            // Login Page
            LoginPage(),

            // Sign Up Page
            SignupPage(),
          ],
        ),
      ),

        ],
        ),
        ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login Page'),
          // Add login form elements here
        ],
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign Up Page'),
          // Add sign-up form elements here
        ],
      ),
    );
  }
}






