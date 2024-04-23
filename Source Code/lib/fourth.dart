import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  TextEditingController _searchController = TextEditingController();

  late List<DocumentSnapshot> routeList; // Define routeList to store Firestore documents

  @override
  void initState() {
    super.initState();
    fetchRoutes(); // Fetch routes when the page is initialized
  }

  void fetchRoutes() async {
    try {
      // Fetch data from Firestore collection 'route'
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('route').get();
      
      setState(() {
        routeList = querySnapshot.docs;
      });
    } catch (error) {
      print('Error fetching routes: $error');
    }
  }

  Widget buildSearchResults() {
    if (routeList == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: routeList.length,
        itemBuilder: (context, index) {
          final route = routeList[index].data() as Map<String, dynamic>;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            elevation: 3,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${route['date']}'),
                  Text('Time: ${route['time']}'),
                  Text('Item: ${route['item']}'),
                ],
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
        title: Text('EASY BUS'),
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
        ],
      ),
    );
  }
}
