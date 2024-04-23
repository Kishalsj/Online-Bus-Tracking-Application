import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapsPage(), // Navigate to MapsPage
              ),
            );
          },
          child: Text('Open Google Maps'),
        ),
      ),
    );
  }
}

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _launchGoogleMaps(); // Call the method to launch Google Maps
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Center(
        child: CircularProgressIndicator(), // You can show a loading indicator while Google Maps is loading
      ),
    );
  }

  _launchGoogleMaps() async {
    // The URL for Google Maps with the query parameter for the current location
    final url = 'https://www.google.com/maps/search/?api=1&query=My+Location';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
