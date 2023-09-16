import 'package:flutter/material.dart';
import 'package:n_eventify/controller/auth.dart';
import 'package:n_eventify/views/account_details.dart';
import 'bottom_navigation_bar.dart';

class Login_SignUp extends StatelessWidget {
  const Login_SignUp({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: TabBar(
                labelColor: Colors.blueGrey, // Text color when selected
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold), // Font size for selected tab
                unselectedLabelStyle: TextStyle(fontSize: 18.0),
                indicatorColor: Color(0xFF00BF63), // Underline color
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(
                    text: 'Login',
                  ),
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

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 46.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26.0), // Add spacing
            // Password Input Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.0),
              child: TextFormField(
                obscureText: true, // Hide password
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 56.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(110, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  primary: Color(0xFF00BF63),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Add spacing between buttons and text
            // Login as Guest Button
            TextButton(
              onPressed: () async{
                dynamic result = await _auth.signInAnonymously();
                if(result == null){
                  print("Error in Sign in Anonymously");
                }
                else{
                  print("Signed in Anonymously");
                  print(result.uid);
                }
              },
              child: Text(
                'Login as Guest',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 36.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),// Add spacing
            // Password Input Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.0),
              child: TextFormField(
                obscureText: true, // Hide password
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 36.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){return AccountDetailScreen();},),);

                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),

                  primary: Color(0xFF00BF63),
                ),
                child: Text('Create Account',
                  style: TextStyle(
                    fontSize: 16,
                  ),),
              ),
            ),
            // Login Button

            // Add login form elements here
          ],
        ),
      ),
    );
  }
}
