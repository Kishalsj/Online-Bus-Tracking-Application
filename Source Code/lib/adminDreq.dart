import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define a model class to represent the data from the database
class Item {
  final String name;
  final String description;
  final DocumentReference reference; // Add reference to document

  Item({required this.name, required this.description, required this.reference});
}

class WelcomeDPage extends StatelessWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final String? selectedItem;

  WelcomeDPage({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome D'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedDate != null
                ? Text(
                    'Selected Date: ${selectedDate.toString().split(' ')[0]}')
                : SizedBox(),
            SizedBox(height: 10),
            selectedTime != null
                ? Text('Selected Time: ${selectedTime!.format(context)}')
                : SizedBox(),
            SizedBox(height: 10),
            selectedItem != null
                ? Text('Selected Item: $selectedItem')
                : SizedBox(),
            SizedBox(height: 20),
            // Displaying cards with data from Firestore
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('route').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  final data = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = Item(
                        name: data[index]['item'],
                        description: 'Date: ${data[index]['date'].toDate()}, Time: ${data[index]['time']}',
                        reference: data[index].reference, // Store reference
                      );
                      return Card(
                        child: ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check),
                                onPressed: () {
                                  // Add your confirm functionality here
                                  print('Confirm button pressed for ${item.name}');
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Delete Firestore data and card
                                  _deleteItem(item.reference);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteItem(DocumentReference reference) async {
    try {
      await reference.delete(); // Delete Firestore data
      print('Item deleted successfully');
    } catch (error) {
      print('Error deleting item: $error');
    }
  }
}
