import 'package:flutter/material.dart';

class AccountDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFC8E6C9), // Green background color for the icon
                shape: BoxShape.circle, // Rounded shape
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_sharp, color: Color(0xFF00BF63)),
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to previous page
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Fill in your bio to get started',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'The data will be displayed in your account profile for security',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      const Text('Male'),
                      Radio(value: 'Male', groupValue: null, onChanged: null),
                      SizedBox(width: 50.0),
                      const Text('Female'),
                      Radio(value: 'Female', groupValue: null, onChanged: null),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){return UploadPhoto();},),);

                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(110, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Color(0xFF00BF63),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFC8E6C9), // Green background color for the icon
            shape: BoxShape.circle, // Rounded shape
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, color: Color(0xFF00BF63)),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to previous page
            },
          ),
        ),
      ),
    ),
          body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          height: 30,
        ),
        Text(
          'Upload your photo profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
          SizedBox(height: 15),
        Text(
          'This data will be displayed in your acccount profile for security',
          style: TextStyle(fontSize: 16),
        ),
          SizedBox(height: 60),
        Center(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 150, // Adjust the size of the profile photo container
                height: 150, // Adjust the size of the profile photo container
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0xFF00BF63),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  // Your profile photo widget goes here
                  backgroundImage: NetworkImage('your_profile_image_url'),
                  // You can use AssetImage or FileImage based on your needs
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      // Implement the logic to remove the profile photo here
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
          const SizedBox(height: 150.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement the logic to navigate to the next screen or perform an action.
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(110, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                primary: Color(0xFF00BF63),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
          ],
      ),
          ),
          ),
      ),
    ),
    );
  }
}