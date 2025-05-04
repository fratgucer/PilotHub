import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/map_page.dart';
import 'pages/logbook_page.dart';
import 'pages/jobs_page.dart';

void main() {
  runApp(PilotHubApp());
}

class PilotHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PilotHub',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: PilotHubMain(),
    );
  }
}

class PilotHubMain extends StatefulWidget {
  @override
  _PilotHubMainState createState() => _PilotHubMainState();
}

class _PilotHubMainState extends State<PilotHubMain> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
    MapPage(),
    LogbookPage(),
    JobsPage(),
  ];

  final List<String> _titles = [
    'Home',
    'Profile',
    'Map',
    'Logbook',
    'Jobs',
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
    BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'Logbook'),
    BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: _navItems,
        onTap: _onTap,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
