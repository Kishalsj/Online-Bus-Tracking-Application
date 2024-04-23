import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navii/adminDreq.dart';
import 'package:navii/driverHome.dart';
import 'package:navii/login.dart';
import 'package:navii/main.dart'; // Import Firestore

class WelcomeScreen2 extends StatefulWidget {
  @override
  _WelcomeScreen2State createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  TextEditingController _routeController = TextEditingController();
  String? _selectedItem;

  // List of city names
  List<String> cityList = [
'Makumbura - Galle',
'Makumbura - Matara',
'Makumbura - Embilipitiya',
'Makumbura - Amabalangoda',
'Makumbura - Negembo',
'Makumbura - Kadawatha',
'Makumbura - Kandy',
'Makumbura - Hambanthota',
'Makumbura - Tangalle',
'Makumbura - Monaragala',
'Makumbura - Badulla',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> _saveDataToFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('route').add({
        'date': _selectedDate,
        'time': _selectedTime != null ? '${_selectedTime!.hour}:${_selectedTime!.minute}' : null,
        'item': _selectedItem,
      });
      print('Data saved to Firestore successfully');
    } catch (error) {
      print('Error saving data to Firestore: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Route & Time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedDate != null
                ? Text('Selected Date: ${_selectedDate.toString().split(' ')[0]}')
                : SizedBox(),
            SizedBox(height: 10),
            _selectedTime != null
                ? Text('Selected Time: ${_selectedTime!.format(context)}')
                : SizedBox(),
            SizedBox(height: 10),
            _selectedItem != null
                ? Text('Selected Item: $_selectedItem')
                : SizedBox(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(_selectedDate == null ? 'Select Date' : 'Change Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(_selectedTime == null ? 'Select Time' : 'Change Time'),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
              items: cityList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _routeController,
              decoration: InputDecoration(
                labelText: 'Enter Message',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check if all required fields are selected
                if (_selectedDate != null && _selectedTime != null && _selectedItem != null) {
                  // Save data to Firestore
                  _saveDataToFirestore();

                  // Show a message indicating request sent
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Request sent'),
                      duration: Duration(seconds: 2), // Adjust the duration as needed
                    ),
                  );

                  // Clear selected items
                  setState(() {
                    _selectedDate = null;
                    _selectedTime = null;
                    _selectedItem = null;
                  });
                } else {
                  // Show an error message if any required field is not selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select all required fields.'),
                      duration: Duration(seconds: 2), // Adjust the duration as needed
                    ),
                  );
                }
              },
              child: Text('Proceed'),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to WelcomePage class file
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}