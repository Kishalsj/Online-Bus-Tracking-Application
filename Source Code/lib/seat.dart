import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:intl/intl.dart';
import 'package:navii/fifth.dart';
import 'package:navii/profile.dart';
import 'package:navii/seven.dart'; // Import DateFormat

class SeatPage extends StatefulWidget {
  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  TextEditingController _searchController = TextEditingController();

  late List<DocumentSnapshot> routeList = []; // Initialize routeList with an empty list

  @override
  void initState() {
    super.initState();
    fetchRoutes(); // Fetch routes when the page is initialized
  }

  void fetchRoutes() async {
    try {
      // Fetch data from Firestore collection 'route'
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('route').get();

      setState(() {
        routeList = querySnapshot.docs;
      });
    } catch (error) {
      print('Error fetching routes: $error');
    }
  }

  Widget buildSearchResults() {
    if (routeList.isEmpty) {
      // Check if routeList is empty
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: routeList.length,
        itemBuilder: (context, index) {
          final route = routeList[index].data() as Map<String, dynamic>;

          // Convert Timestamp to DateTime
          DateTime date = (route['date'] as Timestamp).toDate();

          // Format the date
          String formattedDate =
              DateFormat('yyyy-MM-dd').format(date); // Adjust the format as needed

          return GestureDetector(
            onTap: () {
              // Navigate to SeventhPage when the card is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FifthPage(selectedSeats: [], itemText: '',),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              elevation: 3,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date: $formattedDate'), // Display the formatted date
                    Text('Time: ${route['time']}'),
                    Text('Item: ${route['item']}'),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Search your destination',
                  style: TextStyle(fontSize: 25, fontFamily: 'ADLaM_Display'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    // Implement your filtering logic here if needed
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: buildSearchResults(),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeventhPage(selectedSeats: [], itemText: '',),
                ),
              );
            },
            icon: Icon(Icons.directions_bus, color: Colors.white), // Adding bus icon
            label: Text('MYRIDE', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Setting button color to red
            ),
          ),
          SizedBox(height: 20),
          // ElevatedButton.icon(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ProfilePage(),
          //       ),
          //     );
          //   },
          //   icon: Icon(Icons.people, color: Colors.white), // Adding passenger icon
          //   label: Text('MY PROFILE', style: TextStyle(fontSize: 18)),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue, // Setting button color to blue
          //   ),
          // ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: SeatPage(),
//   ));
// }
