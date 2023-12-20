import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/screens/calendar_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/community_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/education_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/home_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/map_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/report_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';
import 'package:smart_waste_manager_mobile_app/widgets/collection_calendar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettingsScreen(),
    );
  }
}
