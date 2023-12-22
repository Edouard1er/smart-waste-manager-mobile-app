import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/Bienvenu.dart';
import 'package:smart_waste_manager_mobile_app/screens/calendar_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/collecteur_list_view.dart';
import 'package:smart_waste_manager_mobile_app/screens/community_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/education_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/home_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/map_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/order_tracking_page.dart';
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
      home: Bienvenu(),
    );
  }
}

