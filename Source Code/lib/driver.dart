import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'driverHome.dart'; // Importing seventh screen

class WelcomeDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baskerville',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _busNumberController,
                  decoration: InputDecoration(
                    hintText: 'Bus Number (Username)',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Check if bus number and password match with registered credentials
                    bool loggedIn = await _verifyLoginCredentials();

                    if (loggedIn) {
                      // Navigate to the driver home page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    } else {
                      // Show error message for incorrect credentials
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Incorrect bus number or password'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigate to new account page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewAccountPage()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // TextEditingControllers for bus number and password
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to verify login credentials
  Future<bool> _verifyLoginCredentials() async {
    String busNumber = _busNumberController.text;
    String password = _passwordController.text;

    // Get Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query Firestore to check if bus number and password match
    QuerySnapshot querySnapshot = await firestore
        .collection('drivers')
        .where('busNumber', isEqualTo: busNumber)
        .where('password', isEqualTo: password)
        .get();

    // If there's a matching document, login is successful
    return querySnapshot.docs.isNotEmpty;
  }
}

class NewAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Function to save signup data to Firestore
  Future<void> _saveSignUpDataToFirestore() async {
    try {
      // Access the entered values using the controllers
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String phoneNumber = _phoneNumberController.text;
      String busNumber = _busNumberController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      // Get a Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add a new document with a generated ID
      await firestore.collection('drivers').add({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'busNumber': busNumber,
        'email': email,
        'password': password,
      });

      // Sign up successful message
      print('Sign up successful');

      // You can perform further actions here, such as navigating to another screen
    } catch (e) {
      // Handle errors
      print('Error saving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _firstNameController,
          decoration: InputDecoration(
            labelText: 'Driver Name',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _lastNameController,
          decoration: InputDecoration(
            labelText: 'Conductor Name',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _phoneNumberController,
          decoration: InputDecoration(
            labelText: 'Phone Number',
          ),
        ),
         SizedBox(height: 10),
        TextField(
          controller: _busNumberController,
          decoration: InputDecoration(
            labelText: 'Bus NumberPlate Number',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
          ),
        ),
        SizedBox(height: 20),

        // Other form fields...
        ElevatedButton(
          onPressed: () async {
            // Handle signup button press
            print('Sign up button pressed');

            // Validate and process the signup details
            if (_passwordController.text == _confirmPasswordController.text) {
              // Passwords match, proceed with signup
              _saveSignUpDataToFirestore();
       _firstNameController.clear();
       _lastNameController.clear();
       _phoneNumberController.clear();
       _busNumberController.clear();
       _emailController.clear();
       _passwordController.clear();
       _confirmPasswordController.clear();

            } else {
              // Passwords don't match, show an error message
              print('Passwords do not match');
              // You can display an error message to the user indicating that passwords do not match
            }

    //          ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Registration Successful'),
    //     duration: Duration(seconds: 2), // Adjust the duration as needed
    //   ),
    // );

    // // Delay navigating to give time to show the Snackbar
    // await Future.delayed(Duration(seconds: 2));

    //         Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Text('Sign Up'),
        ),
      ],
    );
  }
}
