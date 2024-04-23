import 'package:flutter/material.dart';
import 'package:navii/driverorders.dart';

import 'driverorders.dart'; // Importing seventh screen
import 'date&time.dart'; // Importing seventh screen

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
          children: [
            Text(
              'Welcome !!',
              style: TextStyle(fontSize: 45, fontFamily: 'RobotoSlab'),
            ),
            SizedBox(height: 50),
            Image.asset(
              'assets/busdriver.png', // Path to the image asset
              width: 350, // Adjust width as needed
              height: 350, // Adjust height as needed
            ),
            Spacer(), // Spacer to push the button to the bottom
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverOrders(),
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
