import 'package:flutter/material.dart';
// Importing seventh screen


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with the actual profile picture
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Joined: January 1, 2022', // Replace with user's join date
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('Birthday'),
              subtitle: Text('January 1, 1990'), // Replace with user's birthday
            ),
            ListTile(
              title: Text('Telephone Number'),
              subtitle: Text('123-456-7890'), // Replace with user's telephone number
            ),
            ListTile(
              title: Text('Address'),
              subtitle: Text('123 Street, City, Country'), // Replace with user's address
            ),
          ],
        ),
      ),
    );
  }
}
