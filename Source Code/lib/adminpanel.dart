import 'package:flutter/material.dart';
import 'adminDreq.dart'; // Importing seventh screen
import 'driverreq.dart'; // Importing seventh screen
class WelcomePPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome P'),
      ),
      body: Center(
        child: Text('Welcome P'),
      ),
    );
  }
}



class WelcomeAdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Admin!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePPage(),
                      ),
                    );
                  },
                  child: Text('Passenger Req'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeDPage(selectedDate: null, selectedTime: null, selectedItem: '',),
                      ),
                    );
                  },
                  child: Text('Driver Req'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     title: 'Admin Panel Demo',
//     home: WelcomeAdminPanel(),
//   ));
// }
