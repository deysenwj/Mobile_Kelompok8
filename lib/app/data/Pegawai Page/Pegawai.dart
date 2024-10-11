import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SupplierScreen(),
    );
  }
}

class SupplierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back button functionality
          },
        ),
        title: Text('Supplier'),
        backgroundColor: Colors.brown[400],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari supplier',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                supplierTile('Adriyan'),
                supplierTile('Adriyan'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for adding a new supplier
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }

  ListTile supplierTile(String name) {
    return ListTile(
      title: Text(name),
      trailing: Wrap(
        spacing: 12,
        children: [
          IconButton(
            icon: Icon(FontAwesomeIcons
                .whatsapp), // Using WhatsApp icon from FontAwesome
            onPressed: () {
              // Add WhatsApp functionality
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Add edit functionality
            },
            child: Text('Edit'),
            style: ElevatedButton.styleFrom(
              primary: Colors.brown[400], // Background color
            ),
          ),
        ],
      ),
    );
  }
}
