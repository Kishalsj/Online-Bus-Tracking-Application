import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Registration',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Birthday',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Telephone Number',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 20),
              Text('Select your role:'),
              RadioListTile<String>(
                title: Text('Passenger'),
                value: 'passenger',
                groupValue: 'role',
                onChanged: (String? value) {
                  // Handle passenger radio button selection
                },
              ),
              RadioListTile<String>(
                title: Text('Bus Driver'),
                value: 'driver',
                groupValue: 'role',
                onChanged: (String? value) {
                  // Handle bus driver radio button selection
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement signup functionality
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
