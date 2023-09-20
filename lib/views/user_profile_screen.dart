import 'package:flutter/material.dart';
import 'package:n_eventify/controller/auth.dart';
import 'package:n_eventify/views/login_signup.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class UserProfileScreen extends StatefulWidget {
 class UserProfileScreen extends StatefulWidget {
 }

 class _UserProfileScreenState extends State<UserProfileScreen> {
 File? _selectedImage;
 bool isFollowed = false;
 int followersCount = 442;
 bool isEditMode = false;

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



class _UserProfileScreenState extends State<UserProfileScreen> {
final AuthServices _auth = AuthServices();
@override
Widget build(BuildContext context) {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

return Scaffold(
key: _scaffoldKey, // Add this line to assign the GlobalKey
appBar: AppBar(
backgroundColor: Colors.white,
actions: [

const SizedBox(width: 10),
Container(
width: 40,
height: 40,
decoration: const BoxDecoration(
decoration: BoxDecoration(
shape: BoxShape.circle,
color: Colors.white,
border: Border.all(color: Colors.white, width: 2.0),
),
child: IconButton(
icon: const Icon(Icons.message, color: Colors.greenAccent),
icon: const Icon(Icons.textsms,color: Colors.greenAccent),
onPressed: () {
Scaffold.of(context).openDrawer(); // Handle message button click
Scaffold.of(context).openDrawer(); // Handle list button click
},

),
),



const SizedBox(width: 10),
Container(
width: 40,
 class _UserProfileScreenState extends State<UserProfileScreen> {
border: Border.all(color: Colors.white, width: 2.0),
),
child: IconButton(
icon: const Icon(Icons.list,color: Colors.greenAccent),
icon: const Icon(Icons.view_list_outlined,color: Colors.greenAccent),
onPressed: () {
// Handle list button click
_scaffoldKey.currentState?.openEndDrawer(); // Open the end drawer
},
),
),
), // Create a GestureDetector for the right side corner







],
title: Row(
 class _UserProfileScreenState extends State<UserProfileScreen> {
child: IconButton(
icon: Icon(
isEditMode ? Icons.done : Icons.edit,
color: Colors.greenAccent,
color: Colors.blueGrey,
),
onPressed: () {
// Handle edit button click
class _UserProfileScreenState extends State<UserProfileScreen> {
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(


width: 100,
height: 100,
decoration: BoxDecoration(
color: Colors.green,
borderRadius: BorderRadius.circular(15),
),
child: ClipRRect(
borderRadius: BorderRadius.circular(15),
child: Image.asset(
'assets/logo_withname.png',
fit: BoxFit.cover,
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
 class _UserProfileScreenState extends State<UserProfileScreen> {
ElevatedButton(
onPressed: toggleFollow,
style: ElevatedButton.styleFrom(
backgroundColor: Colors.green,
backgroundColor: Colors.lightGreen,
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
side: const BorderSide(
color: Colors.green,
color: Colors.white,
width: 2,
),
),


),

drawer: Drawer(
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

