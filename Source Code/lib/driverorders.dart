import 'package:flutter/material.dart';


import 'driverreq.dart'; // Importing seventh screen

class DriverOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the first welcome screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen1()),
                );
              },
              child: Text('Reservations'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second welcome screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen2()),
                );
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}




class WelcomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome 1'),
      ),
      body: Center(
        child: Text(
          'Welcome to the first screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}











