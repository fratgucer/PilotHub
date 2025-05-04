import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> jobListings = [
    'First Officer – Turkish Airlines',
    'Flight Instructor – Toronto Flight Club',
    'Captain – Emirates, A380 Fleet',
  ];

  final List<Map<String, String>> airportUpdates = [
    {
      'code': 'LTFM',
      'name': 'Istanbul Airport',
      'metar': 'LTFM 031950Z 02012KT 9999 FEW030 21/13 Q1015',
    },
    {
      'code': 'KBOS',
      'name': 'Boston Logan',
      'metar': 'KBOS 031953Z 24008KT 10SM CLR 18/10 A3012',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Job Opportunities', style: Theme.of(context).textTheme.headline6),
            ...jobListings.map((job) => Card(
                  child: ListTile(
                    leading: Icon(Icons.flight_takeoff),
                    title: Text(job),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text('Apply'),
                    ),
                  ),
                )),
            SizedBox(height: 20),
            Text('Favorite Airports Updates', style: Theme.of(context).textTheme.headline6),
            ...airportUpdates.map((airport) => Card(
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('${airport['name']} (${airport['code']})'),
                    subtitle: Text('METAR: ${airport['metar']}'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
