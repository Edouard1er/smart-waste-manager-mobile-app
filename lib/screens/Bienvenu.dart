import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/BienvenuPhon.dart';
import 'package:smart_waste_manager_mobile_app/screens/choisirQuartier.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';

class Bienvenu extends StatelessWidget {


  Bienvenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(67.0),
              child: Text(
                'Bienvenue',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChoixQuartier()),
                );
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
