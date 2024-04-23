import 'package:flutter/material.dart';
import 'package:navii/seat.dart';

import 'date&time.dart'; // Importing seventh screen
import 'seven.dart'; // Importing seventh screen
import 'new.dart'; // Importing seventh screen

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make Your',
              style: TextStyle(fontSize: 40, fontFamily: 'RobotoSlab'),
            ),
            Text(
              'Online Reservation',
              style: TextStyle(fontSize: 40, fontFamily: 'RobotoSlab'),
            ),
            Text(
              'With Us !!',
              style: TextStyle(fontSize: 40, fontFamily: 'RobotoSlab'),
            ),
            SizedBox(height: 10), // Add some space between the text and image
            Image.asset(
              'assets/login.png', // Path to the image asset
              width: 350, // Adjust width as needed
              height: 350, // Adjust height as needed
            ),
            SizedBox(height: 10), // Add some space between the image and text
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatPage(),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
