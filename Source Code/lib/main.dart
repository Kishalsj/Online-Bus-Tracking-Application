import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navii/firebase_options.dart';
import 'package:navii/login.dart';
import 'package:navii/seat.dart';
import 'second.dart'; // Importing second screen
import 'third.dart'; // Importing third screen
import 'admin.dart'; // Importing admin screen
import 'passenger.dart'; // Importing passenger screen
import 'driver.dart'; // Importing driver screen

 Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EASY BUS',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 134, 133, 133),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 36, 35, 34),
          titleTextStyle: TextStyle(fontFamily: 'RobotoSlab', color: Colors.white, fontSize: 20), // Set app bar's font size to 20
          iconTheme: IconThemeData(color: Colors.white), // Set back button's color to white
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'RobotoSlab'),
          bodyText2: TextStyle(fontFamily: 'RobotoSlab'),
          headline6: TextStyle(fontFamily: 'RobotoSlab', color: Colors.white),
          button: TextStyle(fontFamily: 'RobotoSlab'),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EASY BUS',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/output.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Colors.black,
                ),
                minimumSize: Size(20, 25),
              ),
              child: Text(
                'ADMIN',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Passenger1Page(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Colors.black,
                ),
                minimumSize: Size(20, 25),
              ),
              child: Text(
                'Passenger',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeDriver(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Colors.black,
                ),
                minimumSize: Size(20, 25),
              ),
              child: Text(
                'Driver',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
