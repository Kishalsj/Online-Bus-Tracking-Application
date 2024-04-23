import 'dart:math';
import 'package:flutter/material.dart';
import 'package:navii/seat.dart';
import 'seat.dart'; // Import the SeatPage class file

class TicketDisplay extends StatelessWidget {
  final int totalPayment;
  final int referenceNumber;

  TicketDisplay({required this.totalPayment})
      : referenceNumber = _generateReferenceNumber();

  static int _generateReferenceNumber() {
    // Generate a random 6-digit reference number
    Random random = Random();
    return random.nextInt(900000) + 100000; // Generates a number between 100,000 and 999,999
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Ticket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome! Your ticket is ready.',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Reference Number: $referenceNumber',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Total Payment: $totalPayment',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeatPage()),
                );
              },
              child: Text('Home'), // Change the button text to "Home"
            ),
          ],
        ),
      ),
    );
  }
}