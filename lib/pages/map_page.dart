import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  void _generateFlightPlan(BuildContext context) {
    final from = _fromController.text;
    final to = _toController.text;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Flight Plan Generated'),
        content: Text('From $from to $to using METAR and routing info.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _fromController,
                  decoration: InputDecoration(labelText: 'Departure ICAO (e.g. LTFM)'),
                ),
                TextField(
                  controller: _toController,
                  decoration: InputDecoration(labelText: 'Arrival ICAO (e.g. EGLL)'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _generateFlightPlan(context),
                  child: Text('Generate Flight Plan'),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(41.2753, 28.7519),
                zoom: 5.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.pilothub.app',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
