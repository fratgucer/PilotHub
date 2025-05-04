import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final List<String> jobPosts = [
    'Flight Instructor – Toronto Flight School',
    'First Officer – Lufthansa A320',
    'Captain – Emirates B777',
  ];

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _showApplyDialog(String jobTitle) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Apply for $jobTitle'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // CV attach (file_picker + Firebase Storage later)
                },
                child: Text('Attach Resume'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _nameController.clear();
              _emailController.clear();
              _phoneController.clear();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Application submitted for $jobTitle'),
              ));
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jobPosts.length,
        itemBuilder: (context, index) {
          final job = jobPosts[index];
          return Card(
            child: ListTile(
              title: Text(job),
              trailing: ElevatedButton(
                onPressed: () => _showApplyDialog(job),
                child: Text('Apply'),
              ),
            ),
          );
        },
      ),
    );
  }
}
