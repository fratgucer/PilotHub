import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class LogbookPage extends StatefulWidget {
  @override
  _LogbookPageState createState() => _LogbookPageState();
}

class _LogbookPageState extends State<LogbookPage> {
  final List<Map<String, String>> _flights = [];
  final _departureController = TextEditingController();
  final _arrivalController = TextEditingController();
  final _aircraftController = TextEditingController();
  final _durationController = TextEditingController();

  void _addFlight() {
    if (_departureController.text.isEmpty || _arrivalController.text.isEmpty) return;

    setState(() {
      _flights.add({
        'id': Uuid().v4(),
        'from': _departureController.text,
        'to': _arrivalController.text,
        'aircraft': _aircraftController.text,
        'duration': _durationController.text,
      });
    });

    _departureController.clear();
    _arrivalController.clear();
    _aircraftController.clear();
    _durationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _departureController,
              decoration: InputDecoration(labelText: 'Departure ICAO'),
            ),
            TextField(
              controller: _arrivalController,
              decoration: InputDecoration(labelText: 'Arrival ICAO'),
            ),
            TextField(
              controller: _aircraftController,
              decoration: InputDecoration(labelText: 'Aircraft Type'),
            ),
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duration (hrs)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addFlight,
              child: Text('Log Flight'),
            ),
            Divider(height: 30),
            Expanded(
              child: ListView(
                children: _flights.map((flight) {
                  return ListTile(
                    leading: Icon(Icons.flight),
                    title: Text('${flight['from']} → ${flight['to']}'),
                    subtitle: Text('Aircraft: ${flight['aircraft']}, Duration: ${flight['duration']} hrs'),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

