import 'package:flutter/material.dart';

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
  Navigator.of(context).pop(); // Navigate back to previous page
  },
  ),
  ),
  ),
  ),
body: SingleChildScrollView(
child : Padding(
padding: EdgeInsets.all(16.0),
child: Form(
key: _formKey,
child: Column(
children: [
  SizedBox(height: 30),
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
      padding: EdgeInsets.only(right: 10), // Add padding to the right
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Color(0xFFC8E6C9),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.image, size: 60, color: Color(0xFF00BF63)),
            SizedBox(height: 10),
            Text('Click and upload image/video', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement image/video upload functionality
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFC8E6C9), // Background color
                onPrimary: Color(0xFF00BF63), // Button text color
                side: BorderSide(width: 2, color: Color(0xFF00BF63)), // Border color and width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Increased border radius
                ),
              ),
              child: Text('Upload'),
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
        decoration: InputDecoration(
          labelText: 'Event Name',
          icon: Padding(
            padding: EdgeInsets.only(left: 10), // Adding left padding here
            child: Icon(Icons.event, color: Color(0xFF00BF63)),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10), // Adjust as needed
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
    child : Icon(Icons.location_on, color: Color(0xFF00BF63)),
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
Row( // Row for Date and Max Entries fields
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
    padding: EdgeInsets.only(left: 10),
child: Icon(Icons.calendar_today, color: Color(0xFF00BF63)),
  ),
border: InputBorder.none,
  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter the date';
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
child: Icon(Icons.group, color: Color(0xFF00BF63)),
  ),
border: InputBorder.none,
  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
    padding: EdgeInsets.only(left: 10),
child: Icon(Icons.access_time, color: Color(0xFF00BF63)),
  ),
border: InputBorder.none,
  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter the start time';
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
    padding: EdgeInsets.only(left: 10),
child: Icon(Icons.access_time, color: Color(0xFF00BF63)),
  ),
border: InputBorder.none,
  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter the end time';
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
if (_formKey.currentState != null && _formKey.currentState!.validate()) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Event created successfully!')),
);
}
},
child: Text('Create Event'),
style: ElevatedButton.styleFrom(primary: Color(0xFF00BF63)),
),
],
),
),
),
)
);
}
}
