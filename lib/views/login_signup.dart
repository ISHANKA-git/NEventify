import 'package:flutter/material.dart';
import 'package:n_eventify/controller/auth.dart';
import 'package:n_eventify/views/account_details.dart';
import 'package:n_eventify/views/home_page.dart';
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
              padding: EdgeInsets.all(40.0),
              child: Image.asset(
                'assets/logo_withname.png', // Replace with your app logo image
                height: 120.0, // Adjust the height as needed
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
  // ref for the auth services class
  final AuthServices _auth = AuthServices();
  // form key
  final _formKey = GlobalKey<FormState>();
  //e mail password state
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.0),
                child: TextFormField(
                  validator: (val) =>
                    val?.isEmpty == true ? "Enter a valid email" : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },

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
                  validator: (val) =>
                  val!.length < 6 ? "Enter a valid password" : null,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
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
              SizedBox(height: 16.0),

              Text(error,
              style: TextStyle(
                color: Colors.red,
              ),),
              SizedBox(height: 16.0),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.0),
                child: ElevatedButton(
                  onPressed: () async {
                    dynamic result = await _auth.signInUsingEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = "Coudn't signin with those credentials";
                      });
                    }

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
              SizedBox(height: 26.0),
              
              Text("Or Continue With",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[600],),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap:(){} ,
                child: Image.asset(
                  'assets/google-icon 1.png', // Replace with your app logo image
                  height: 30.0, // Adjust the height as needed
                ),
              ),
              SizedBox(height: 16.0),
              // Login as Guest Button
              GestureDetector(
                onTap: () async{


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
      ),
    );
  }
}


class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthServices _auth = AuthServices();
  // form key
  final _formKey = GlobalKey<FormState>();
  //e mail password state
  String email = "";
  String name = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 36.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.0),
                child: TextFormField(
                  validator: (val) =>
                  val?.isEmpty == true ? "Enter a valid email" : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
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
                  onChanged: (val){
                    setState(() {
                      name = val;
                    });
                  },
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
                  validator: (val) =>
                  val!.length < 6 ? "Enter a valid password" : null,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
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
                  onPressed: () async {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = "Please Enter a valid E-mail !";
                      });
                    }
<<<<<<< HEAD
=======
                    Navigator.push(context, MaterialPageRoute(builder: (context){return AccountDetailScreen();},),);
>>>>>>> parent of 5f0f08b (Issue fixed on home page)

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
              Text(error,
              style: TextStyle(
                color: Colors.red,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
