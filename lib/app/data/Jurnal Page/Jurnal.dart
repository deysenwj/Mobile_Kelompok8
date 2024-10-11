import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan ini untuk DateFormat

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnal',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: JournalScreen(),
    );
  }
}

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  String _selectedCategory = 'All Categories';

  final List<String> _categories = [
    'All Categories',
    'Category 1',
    'Category 2'
  ];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _selectedStartDate : _selectedEndDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null &&
        picked != (isStartDate ? _selectedStartDate : _selectedEndDate)) {
      setState(() {
        if (isStartDate) {
          _selectedStartDate = picked;
        } else {
          _selectedEndDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jurnal'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: DateFormat('yyyy-MM-dd')
                              .format(_selectedStartDate),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText:
                              DateFormat('yyyy-MM-dd').format(_selectedEndDate),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Kategori/produk',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to show journal data
              },
              child: Text('Grafik'),
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
              ),
            ),
            SizedBox(height: 16.0),
            Divider(),
            JournalEntry(
              date: '2024-09-27',
              price: 'Rp102,000',
              description: 'Lunas-Cash',
              total: '102,000',
            ),
            JournalEntry(
              date: '2024-10-27',
              price: '2 X Rp100,000',
              description: 'Lunas-Cash',
              total: '200,000',
            ),
          ],
        ),
      ),
    );
  }
}

class JournalEntry extends StatelessWidget {
  final String date;
  final String price;
  final String description;
  final String total;

  const JournalEntry({
    required this.date,
    required this.price,
    required this.description,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tanggal: $date'),
          Text('Harga: $price'),
          Text('Keterangan: $description'),
          Text('Total: $total'),
          Divider(),
        ],
      ),
    );
  }
}
