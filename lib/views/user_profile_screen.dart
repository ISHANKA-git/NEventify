import 'package:flutter/material.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(Icons.message),
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
                icon: const Icon(Icons.list),
                onPressed: () {
                  // Handle list button click
                },
              ),
            ),
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
                  color: Colors.greenAccent,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          isEditMode ? Icons.done : Icons.edit,
                          color: Colors.greenAccent,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/logo_withname.png',
                              fit: BoxFit.cover,
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
                                backgroundColor: Colors.green,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                    color: Colors.green,
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
    );
  }
}
