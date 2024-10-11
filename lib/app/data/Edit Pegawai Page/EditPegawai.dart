import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditPegawaiScreen(),
    );
  }
}

class EditPegawaiScreen extends StatefulWidget {
  @override
  _EditPegawaiScreenState createState() => _EditPegawaiScreenState();
}

class _EditPegawaiScreenState extends State<EditPegawaiScreen> {
  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaPegawaiController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();

  String? selectedPegawai = 'Admin';
  String? selectedStatus = 'Suspend';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit pegawai'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back navigation logic here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Kosongkan jika tidak diubah',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _namaPegawaiController,
              decoration: InputDecoration(
                labelText: 'Nama pegawai',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nomorTeleponController,
              decoration: InputDecoration(
                labelText: 'Nomor telepon',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedPegawai,
              items: ['Admin', 'Staff'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPegawai = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Pegawai',
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              items: ['Active', 'Inactive', 'Suspend'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedStatus = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Status pegawai',
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // Hapus logic
                    print("Data pegawai dihapus");
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  iconSize: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Simpan logic
                    print("Username: ${_usernameController.text}");
                    print("Password: ${_passwordController.text}");
                    print("Nama Pegawai: ${_namaPegawaiController.text}");
                    print("Nomor Telepon: ${_nomorTeleponController.text}");
                    print("Pegawai: $selectedPegawai");
                    print("Status Pegawai: $selectedStatus");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .brown, // Set color to match the button in the image
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text('SIMPAN'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
