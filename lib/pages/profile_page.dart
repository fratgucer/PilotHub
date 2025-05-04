import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum ProfileType { individual, commercial }

class _ProfilePageState extends State<ProfilePage> {
  ProfileType? _selectedType;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  void _submit() {
    if (_selectedType == null || _nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill all required fields.'),
      ));
      return;
    }
    print("Submitted: ${_nameController.text}, ${_selectedType.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Select Profile Type:', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('Individual Pilot'),
              leading: Radio<ProfileType>(
                value: ProfileType.individual,
                groupValue: _selectedType,
                onChanged: (ProfileType? value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Commercial (School/Airline)'),
              leading: Radio<ProfileType>(
                value: ProfileType.commercial,
                groupValue: _selectedType,
                onChanged: (ProfileType? value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _licenseController,
              decoration: InputDecoration(labelText: 'License Type'),
            ),
            TextField(
              controller: _experienceController,
              decoration: InputDecoration(labelText: 'Experience (hours/years)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Save Profile'),
            )
          ],
        ),
      ),
    );
  }
}
