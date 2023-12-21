import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';

class Bienvenu extends StatelessWidget {
  final List<WasteBin> wasteBins;

  Bienvenu({required this.wasteBins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action lorsque le bouton de retour est pressé
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(67.0),
              child: Text(
                'Bienvenue sur ',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'SMART WAB',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            bottom: 150.0,
            child: ElevatedButton(
              onPressed: () {
                // Action du bouton "Commencer"
                // Vous pouvez définir le comportement souhaité ici
              },
              child: Text('Commencer'),
            ),
          ),
        ],
      ),
    );
  }
}
