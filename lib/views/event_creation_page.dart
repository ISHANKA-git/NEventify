import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EventCreationPage extends StatefulWidget {
  @override
  _EventCreationPageState createState() => _EventCreationPageState();
}

class _EventCreationPageState extends State<EventCreationPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _clubNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _maxEntriesController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  String? _selectedImagePath; // Store the selected image path

  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // Initialize Firestore

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path; // Store the selected image path
      });
    }
  }

  void resetForm() {
    _eventNameController.clear();
    _clubNameController.clear();
    _locationController.clear();
    _dateController.clear();
    _maxEntriesController.clear();
    _tagsController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
    setState(() {
      _selectedImagePath = null;
    });
  }

  void createEvent() {
    // Get data from form controllers
    String eventName = _eventNameController.text;
    String clubName = _clubNameController.text;
    String location = _locationController.text;
    String date = _dateController.text;
    int maxEntries = int.tryParse(_maxEntriesController.text) ?? 0;
    List<String> tags = _tagsController.text.split(',');

    // Create a reference to a Firestore collection (e.g., 'events')
    CollectionReference events = firestore.collection('events');

    // Add a new document to the collection
    events.add({
      'eventName': eventName,
      'clubName': clubName,
      'location': location,
      'date': date,
      'maxEntries': maxEntries,
      'tags': tags,
      'startTime': _startTimeController.text,
      'endTime': _endTimeController.text,
      'imagePath':
          _selectedImagePath, // Add the selected image path to the Firestore document
    }).then((value) {
      // Document added successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event created successfully!')),
      );
      // Optionally, you can navigate to another page or perform other actions here
    }).catchError((error) {
      // Handle errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating event: $error')),
      );
    });
    resetForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.of(context)
                    .pop(); // Navigate back to the previous page
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create Event',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: 10), // Add padding to the right
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Color(0xFFC8E6C9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          if (_selectedImagePath != null)
                            Column(
                              children: [
                                SizedBox(height: 10), // Add some spacing
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center the text and icon horizontally
                                  children: [
                                    Icon(
                                      Icons
                                          .image, // You can change this to an appropriate icon
                                      color: Color(0xFF00BF63), // Icon color
                                    ),
                                    SizedBox(
                                        width:
                                            5), // Add spacing between the icon and text
                                    Flexible(
                                      child: Text(
                                        'Selected Image: ${_selectedImagePath!.split('/').last}', // Display the image file name
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color(0xFF00BF63), // Text color
                                        ),
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis for long names
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          SizedBox(height: 10),
                          Text('Click and upload image/video',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: Text('Upload Image'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFC8E6C9),
                              onPrimary: Color(0xFF00BF63),
                              side: BorderSide(
                                  width: 2, color: Color(0xFF00BF63)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      controller: _eventNameController,
                      decoration: const InputDecoration(
                        labelText: 'Event Name',
                        icon: Padding(
                          padding: EdgeInsets.only(
                              left: 10), // Adding left padding here
                          child: Icon(Icons.event, color: Color(0xFF00BF63)),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 10, 10, 10), // Adjust as needed
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an event name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      controller: _clubNameController,
                      decoration: InputDecoration(
                        labelText: 'Name of Club',
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.people, color: Color(0xFF00BF63)),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the club name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                              Icon(Icons.location_on, color: Color(0xFF00BF63)),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the location';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  // Row for Date and Max Entries fields
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'Date',
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.calendar_today,
                                    color: Color(0xFF00BF63)),
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            readOnly: true, // Prevent manual input
                            onTap: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(DateTime.now().year + 1),
                              );
                              if (selectedDate != null) {
                                setState(() {
                                  _dateController.text = selectedDate
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0];
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            controller: _maxEntriesController,
                            decoration: InputDecoration(
                              labelText: 'Max Entries',
                              icon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child:
                                    Icon(Icons.group, color: Color(0xFF00BF63)),
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the max entries';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      controller: _tagsController,
                      decoration: InputDecoration(
                        labelText: 'Enter tags that will go with event',
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.tag, color: Color(0xFF00BF63)),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter tags';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            controller: _startTimeController,
                            decoration: InputDecoration(
                              labelText: 'Start Time',
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.access_time, color: Color(0xFF00BF63)),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                            ),
                            readOnly: true, // Prevent manual input
                            onTap: () async {
                              final selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (selectedTime != null) {
                                setState(() {
                                  _startTimeController.text = selectedTime.format(context);
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a start time';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            controller: _endTimeController,
                            decoration: InputDecoration(
                              labelText: 'End Time',
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.access_time, color: Color(0xFF00BF63)),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            readOnly: true, // Prevent manual input
                            onTap: () async {
                              final selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (selectedTime != null) {
                                setState(() {
                                  _endTimeController.text = selectedTime.format(context);
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select an end time';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      createEvent(); // Call the createEvent function to add data to Firestore
                    }
                  },
                  child: Text('Create Event'),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF00BF63)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
