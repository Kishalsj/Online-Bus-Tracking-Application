import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'passengerHome.dart'; // Importing seventh screen

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class Passenger1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 170, 170),
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
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
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
                    // Check if username and password match with registered credentials
                    bool loggedIn = await _verifyLoginCredentials();

                    if (loggedIn) {
                      // Navigate to the welcome page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    } else {
                      // Show error message for incorrect credentials
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Incorrect username or password'),
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

  // Function to verify login credentials
  Future<bool> _verifyLoginCredentials() async {
    String firstName = _firstNameController.text;
    String password = _passwordController.text;

    // Get Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query Firestore to check if username and password match
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where('firstName', isEqualTo: firstName)
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
      backgroundColor: Color.fromARGB(255, 170, 170, 170),
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
      String email = _emailController.text;
      String password = _passwordController.text;

      // Get a Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add a new document with a generated ID
      await firestore.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password, // You may want to reconsider saving passwords directly like this, it's generally not recommended.
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
            labelText: 'First Name',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _lastNameController,
          decoration: InputDecoration(
            labelText: 'Last Name',
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
       _emailController.clear();
       _passwordController.clear();
       _confirmPasswordController.clear();

    //  Show success message using a Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registration Successful'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );

    // Delay navigating to give time to show the Snackbar
    await Future.delayed(Duration(seconds: 2));

            Navigator.of(context).popUntil((route) => route.isFirst);
            } else {
              // Passwords don't match, show an error message
              print('Passwords do not match');
              // You can display an error message to the user indicating that passwords do not match
            }

            // Show success message using a Snackbar
    // ScaffoldMessenger.of(context).showSnackBar(
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
