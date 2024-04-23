// import 'package:flutter/material.dart';
// import 'fifth.dart'; // Importing fifth screen
// import 'seven.dart'; // Importing seventh screen
// import 'profile.dart'; // Importing kishaal screen

// class FourthPage extends StatefulWidget {
//   @override
//   _FourthPageState createState() => _FourthPageState();
// }

// class _FourthPageState extends State<FourthPage> {
//   TextEditingController _searchController = TextEditingController();

//   List<String> destinations = [
//     'Galle - Makubura    NC-3659',
//     'Galle - Makubura    NB-4581',
//     'Galle - Makubura    NB-4589',
//     'Matara - Makubura    NC-4863',
//     'Matara - Makubura    NV-4863',
//   ];

//   List<String> filteredDestinations = [];

//   @override
//   void initState() {
//     filteredDestinations.addAll(destinations);
//     super.initState();
//   }

//   void filterDestinations(String query) {
//     setState(() {
//       filteredDestinations = destinations
//           .where((destination) =>
//               destination.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   Widget buildSearchResults() {
//     return ListView.builder(
//       itemCount: filteredDestinations.length,
//       itemBuilder: (context, index) {
//         final destination = filteredDestinations[index];
//         return OutlinedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => FifthPage(itemText: destination),
//               ),
//             );
//           },
//           style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.black), // Add black border
//           ),
//           child: RichText(
//             text: TextSpan(
//               text: destination.substring(0, _searchController.text.length),
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//               children: [
//                 TextSpan(
//                   text: destination.substring(_searchController.text.length),
//                   style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EASY BUS'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Text(
//                   'Search your destination',
//                   style: TextStyle(fontSize: 25, fontFamily: 'ADLaM_Display'),
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: _searchController,
//                   onChanged: (value) {
//                     filterDestinations(value);
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: buildSearchResults(),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SeventhPage(selectedSeats: []),
//                 ),
//               );
//             },
//             icon: Icon(Icons.directions_bus, color: Colors.white), // Adding bus icon
//             label: Text('MYRIDE', style: TextStyle(fontSize: 18)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red, // Setting button color to red
//               side: BorderSide(color: Colors.black), // Add black border
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProfilePage(), // Navigate to Kishaal
//                 ),
//               );
//             },
//             icon: Icon(Icons.people, color: Colors.white), // Adding passenger icon
//             label: Text('PROFILE', style: TextStyle(fontSize: 18)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Setting button color to blue
//               side: BorderSide(color: Colors.black), // Add black border
//             ),
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
