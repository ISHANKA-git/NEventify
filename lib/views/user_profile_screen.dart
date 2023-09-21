import 'package:flutter/material.dart';
import 'package:n_eventify/controller/auth.dart';
import 'package:n_eventify/views/login_signup.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  final AuthServices _auth = AuthServices();
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File? _selectedImage;

  bool isFollowed = false;
  int followersCount = 442;
  bool isEditMode = false;
  String name = 'Loshika Perera';
  String bio =
      "I'm a music lover and tech enthusiast with a passion for attending and discovering exciting events.";
  String focVersion = 'FOC 21.1';
  bool isAddButtonPressed = false;
  int currentImageIndex = 0;

  List<String> images = ['Profile2.png', 'assets/logo_withname.png', 'assets/profile1.png'];

  void toggleFollow() {
    setState(() {
      if (isFollowed) {
        isFollowed = false;
        followersCount--;
      } else {
        isFollowed = true;
        followersCount++;
      }
    });
  }

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  void toggleAddButton() {
    setState(() {
      isAddButtonPressed = !isAddButtonPressed;
      if (!isAddButtonPressed) {
        currentImageIndex = 0; // Reset image index when Add button is toggled off
      }
    });
  }

  void showNextImage() {
    setState(() {
      currentImageIndex++;
      if (currentImageIndex >= images.length) {
        currentImageIndex = 0; // Loop back to the first image
      }


    });
  }


  //rate app
  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Center(
            child: Text(
              "Did you enjoy the app?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Give us a quick rating so we know if you like it?"),
              const SizedBox(height: 20),
              RatingBar.builder(
                initialRating: 5, // Initial rating value (5 stars)
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 40,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) async {
                  // Handle the rating and open the Google Play Store
                  final playStoreUrl = 'YOUR_GOOGLE_PLAY_STORE_LINK'; // Replace with your app's Play Store URL
                  if (rating >= 4.0) {
                    if (await canLaunch(playStoreUrl)) {
                      await launch(playStoreUrl);
                    } else {
                      throw 'Could not launch $playStoreUrl';
                    }
                  }
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }






  // Function to open more apps in the Play Store
  void openMoreApps() async {
    const playStoreUrl = 'https://play.google.com/store/apps/developer?id=Your+Developer+Name';

    if (await canLaunch(playStoreUrl)) {
      await launch(playStoreUrl);
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }




  // Function to share the app
  void shareApp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.textsms,
                color: Colors.blueGrey, // Gmail icon with red color
              ),
              title: const Text('Share via SMS'),
              onTap: () {
                Share.share('Check out my awesome app: YOUR_APP_NAME via SMS');
                Navigator.of(context).pop(); // Close the modal sheet
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.email,
                color: Colors.grey, // Gmail icon with red color
              ),
              title: const Text('Share via Email'),
              onTap: () {
                Share.share('Check out my awesome app: YOUR_APP_NAME via Email');
                Navigator.of(context).pop(); // Close the modal sheet
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.bluetooth,
                color: Colors.blue, // Bluetooth icon with blue color
              ),
              title: const Text("Bluetooth"),
              onTap: () {
                // Handle Bluetooth functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.copy,
                color: Colors.green, // Copy to Clipboard icon with green color
              ),
              title: const Text("Copy to Clipboard"),
              onTap: () {
                // Handle Copy to Clipboard functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.wifi,
                color: Colors.orange, // Wi-Fi Direct icon with orange color
              ),
              title: const Text("Wi-Fi Direct"),
              onTap: () {
                // Handle Wi-Fi Direct functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.message,
                color: Colors.green, // WhatsApp icon with green color
              ),
              title: const Text("WhatsApp"),
              onTap: () {
                // Handle WhatsApp functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.near_me,
                color: Colors.blue, // Nearby Share icon with blue color
              ),
              title: const Text("Nearby Share"),
              onTap: () {
                // Handle Nearby Share functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.chat,
                color: Colors.blue, // Chats icon with blue color
              ),
              title: const Text("Chats"),
              onTap: () {
                // Handle Chats functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.mail,
                color: Colors.red, // Gmail icon with red color
              ),
              title: const Text("Gmail"),
              onTap: () {
                // Handle Gmail functionality
              },
            ),


            // Add more sharing options as needed
          ],
        );
      },
    );
  }








  // Function to provide feedback
  void showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Text("Your Valuable Feedback "),
              Icon(
                Icons.sentiment_satisfied, // Add a smiley emoji or any other icon here
                color: Colors.green, // Customize the icon color
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Please enter your feedback below:"),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your feedback here',
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  const email = 'your@email.com'; // Replace with your feedback email
                  const subject = 'Feedback for YOUR_APP_NAME'; // Replace with your app's name

                  final url = 'mailto:$email?subject=$subject';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("Submit"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }











  // Function to open the privacy policy
  void openPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Google Privacy Policy Agreement',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'You must agree with the Google Privacy Policy!',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'View Privacy Policy',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () async {
                const privacyPolicyUrl = 'https://policies.google.com/privacy';
                if (await canLaunch(privacyPolicyUrl)) {
                  await launch(privacyPolicyUrl);
                } else {
                  throw 'Could not launch $privacyPolicyUrl';
                }
              },
            ),
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//function to edit profile picture
  Future<void> _showImagePickerDialog() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<File?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Profile Picture'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Picture'),
                onTap: () async {
                  final pickedFile =
                  await picker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop(pickedFile != null
                      ? File(pickedFile.path)
                      : null);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Select from Gallery'),
                onTap: () async {
                  final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
                  Navigator.of(context).pop(pickedFile != null
                      ? File(pickedFile.path)
                      : null);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Remove Current Picture'),
                onTap: () {
                  Navigator.of(context).pop(null);
                },
              ),
            ],
          ),
        );
      },
    );

    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }



  // Function to check for updates
  void checkForUpdates(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Upgrade Now!',
            style: TextStyle(color: Colors.red),
          ),
          content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'No other upgrades available for Nventify ',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.green,
                      size: 30,
                    ),
                    Text(
                      ' 😊',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ]
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }



  // Function to profilesearch
  void profilesearch(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.near_me_outlined,
                  color: Color(0xFF00BF63) // Gmail icon with red color
              ),
              title: const Text('🙎‍♀️‍♂  Amanda sewuwanndi'),
              onTap: () {
                Share.share('Check out my awesome app: YOUR_APP_NAME via SMS');
                Navigator.of(context).pop(); // Close the modal sheet
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.near_me_outlined,
                color: Color(0xFF00BF63), // Nearby Share icon with blue color
              ),
              title: const Text("👨‍💼♀  Bagaya wishwajith"),
              onTap: () {
                // Handle Nearby Share functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.near_me_outlined,
                color: Color(0xFF00BF63), // Chats icon with blue color
              ),
              title: const Text("🧕🏾♂  Saguna fathima"),
              onTap: () {
                // Handle Chats functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.near_me_outlined,
                color: Color(0xFF00BF63), // Gmail icon with red color
              ),
              title: const Text("🙍‍♀  Chamoth Gayan"),
              onTap: () {
                // Handle Gmail functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.near_me_outlined,
                color: Color(0xFF00BF63), // Gmail icon with red color
              ),
              title: const Text(" 🙎‍♀️♂   kathi areena"),
              onTap: () {
                // Handle Gmail functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.near_me_outlined,
                color: Color(0xFF00BF63), // Gmail icon with red color
              ),
              title: const Text('👩🏻‍♂  kathi areena'),
              onTap: () {
                // Handle Gmail functionality
              },
            ),




            ListTile(
              leading: const Icon(
                Icons.near_me_outlined,
                color: Color(0xFF00BF63), // Gmail icon with red color
              ),
              title: const Text('🙎‍♀  Kalpana dilshan'),
              onTap: () {
                // Handle Gmail functionality
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.search_off_outlined,
                color: Color(0xFF00BF63), // Gmail icon with red color
              ),
              title: const Text("search more friends"),
              onTap: () {
                // Handle Gmail functionality
              },
            ),

            // Add more sharing options as needed
          ],
        );
      },
    );
  }












  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _scaffoldKey, // Add this line to assign the GlobalKey
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [


           // Add a Flexible widget to allow the search bar to expand
            Flexible(
              child: Visibility(

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField( // Search icon color, set to #00BF63
                    decoration: InputDecoration(
                      hintText: 'Search your friend', // Placeholder text
                      border: InputBorder.none,
                      prefixIcon: GestureDetector(
                        onTap: () {
                          profilesearch(context); // Call your search function here
                        },
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF00BF63), // Search icon color, set to #00BF63
                        ),
                      ),





                    ),
                    // Your search bar implementation here
                  ),
                ),
              ),
            ),











            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(Icons.message, color: Color(0xFF00BF63)),
                onPressed: () {
                  // Handle message button click
                },

              ),
            ),


            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              child: IconButton(
                icon: const Icon(Icons.list,color: Color(0xFF00BF63)),
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer(); // Open the end drawer
                },
              ),
            ),

          ],
          title: Row(
            children: [

              const SizedBox(width: 10),

            ],
          ),
        ),

        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              // First Row
              Container(
                color: Colors.white,
                // Add your content here
              ),
              // Second Row
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF00BF63),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            isEditMode ? Icons.done : Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Handle edit button click
                            toggleEditMode();
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Semantics(
                              label: 'Photo Profile (1).png', // Set the alt text here
                              child: GestureDetector(
                                onTap: _showImagePickerDialog,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: _selectedImage != null
                                      ? Image.file(_selectedImage!, fit: BoxFit.cover)
                                      : Image.asset('assets/thammu.png', fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),
                          isEditMode
                              ? TextFormField(
                            initialValue: name,
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                          )
                              : Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          isEditMode
                              ? TextFormField(
                            initialValue: focVersion,
                            onChanged: (value) {
                              setState(() {
                                focVersion = value;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'focVersion',
                            ),
                          )
                              : Column(
                            children: [
                              Text(
                                focVersion,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black38),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                          if (isEditMode)
                            TextFormField(
                              initialValue: bio,
                              onChanged: (value) {
                                setState(() {
                                  bio = value;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'bio',
                              ),
                            )
                          else
                            Text(
                              bio,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              textAlign: TextAlign.center,
                            ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    followersCount.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    'FOLLOWERS',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ],
                              ),
                              const Text('|'),
                              const Column(
                                children: [
                                  Text(
                                    '35',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'FOLLOWING',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: toggleFollow,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                      color: Colors.yellow,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  isFollowed ? 'FOLLOWED' : 'FOLLOW',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Third Row - Increment Button and Profile Picture Icons
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        toggleAddButton();
                        showNextImage();
                      },
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: currentImageIndex >= 1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(images[0]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: currentImageIndex >= 2,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(images[1]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: currentImageIndex >= 3,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(images[2]),
                      ),
                    ),
                  ],
                ),
              ),
              // Fourth Row (Scrollable Icons)
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Add your scrollable icons here
                    Icon(Icons.star),
                    Icon(Icons.favorite),
                    Icon(Icons.comment),
                    Icon(Icons.share),
                    Icon(Icons.send),
                  ],
                ),
              ),
            ],
          ),

        ),

        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Drawer header with app icon
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Display app icon at the top center
                    Icon(Icons.event, size: 100, color: Colors.deepPurple),
                    SizedBox(height: 10),
                    Text(
                      "App Name", // Display app name
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),

              // Menu items


              ListTile(
                leading: const Icon(
                  Icons.star,
                  color: Colors.yellow, // Customize the icon color as needed
                ),
                title: const Text("Rate Us"),
                onTap: () {
                  showRatingDialog(context);
                },
              ),


              ListTile(
                leading: const Icon(Icons.apps,
                  color: Colors.brown,),
                title: const Text("More Apps (Ad)"),
                onTap: openMoreApps,
              ),
              ListTile(
                leading: const Icon(Icons.share,
                    color: Colors.lightGreen
                ),
                title: const Text("Share"),
                onTap: () {
                  shareApp(context); // Pass the BuildContext to the function
                },
              ),



              ListTile(
                leading: const Icon(
                  Icons.feedback,
                  color: Colors.blue, // Customize the icon color as needed
                ),
                title: const Text("Feedback"),
                onTap: () {
                  showFeedbackDialog(context);
                },
              ),

// Add the "Privacy Policy" ListTile in the Drawer
              ListTile(
                leading: const Icon(Icons.policy),
                title: const Text("Privacy Policy"),
                onTap: () {
                  openPrivacyPolicyDialog(context); // Open the privacy policy dialog
                },
              ),



              ListTile(
                leading: const Icon(Icons.system_update),
                title: const Text("Check For Updates"),
                onTap: () {
                  checkForUpdates(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () async {
                  Navigator.pop(context); // Close the Drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context){return const Login_SignUp();},),);
                  await widget._auth.signOut(); // Sign out the user

                },
              ),











            ],
          ),
        )
    );
















  }
}