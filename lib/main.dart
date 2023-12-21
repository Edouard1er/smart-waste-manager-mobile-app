import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/screens/calendar_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/community_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/education_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/home_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/map_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/report_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';
import 'package:smart_waste_manager_mobile_app/widgets/collection_calendar_widget.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Déchets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MapScreen(),
    CollectionCalendar(),
    CommunityScreen(),
    EducationScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Gestion des Déchets'),
      // ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Carte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Communauté',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Éducation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Carte'),
              onTap: () {
                setState(() {
                  _currentIndex = 0; // Index de l'écran de la carte
                  Navigator.pop(context); // Fermer le menu latéral
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendrier'),
              onTap: () {
                setState(() {
                  _currentIndex = 1; // Index de l'écran du calendrier
                  Navigator.pop(context); // Fermer le menu latéral
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Communauté'),
              onTap: () {
                setState(() {
                  _currentIndex = 2; // Index de l'écran de la communauté
                  Navigator.pop(context); // Fermer le menu latéral
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Éducation'),
              onTap: () {
                setState(() {
                  _currentIndex = 3; // Index de l'écran de l'éducation
                  Navigator.pop(context); // Fermer le menu latéral
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                setState(() {
                  _currentIndex = 4; // Index de l'écran du profil
                  Navigator.pop(context); // Fermer le menu latéral
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


