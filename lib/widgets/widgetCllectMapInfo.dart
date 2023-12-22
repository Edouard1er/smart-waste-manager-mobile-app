import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';

class CollectMapInfoWidget extends StatelessWidget {
  final String distance;
  final String time;
  final int totalPoubelle;
  final int totalMaison;
  final int totalEndommage;
  final int score;

  CollectMapInfoWidget({
    required this.distance,
    required this.time,
    required this.totalPoubelle,
    required this.totalMaison,
    required this.totalEndommage,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Collecte Info'),
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
      
      body: Padding(
        
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Center(
              child: Text(
                'SMART WAB',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 260.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton "Distance" est pressé.
                  },
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond du bouton
                    elevation: 2.0, // Ombre
                    side: BorderSide(color: Colors.green, width: 4.0), // Bordure verte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Distance $distance', style: TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton "Temps" est pressé.
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond du bouton
                    elevation: 2.0, // Ombre
                    side: BorderSide(color: Colors.green, width: 2.0), // Bordure verte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Temps $time', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton "Total poubelle" est pressé.
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond du bouton
                    elevation: 2.0, // Ombre
                    side: BorderSide(color: Colors.green, width: 2.0), // Bordure verte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total poubelle $totalPoubelle', style: TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton "Total maison" est pressé.
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond du bouton
                    elevation: 2.0, // Ombre
                    side: BorderSide(color: Colors.green, width: 2.0), // Bordure verte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total maison $totalMaison', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton "Total endommagé" est pressé.
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond du bouton
                    elevation: 2.0, // Ombre
                    side: BorderSide(color: Colors.green, width: 2.0), // Bordure verte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total endommagé $totalEndommage', style: TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton "Score" est pressé.
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond du bouton
                    elevation: 2.0, // Ombre
                    side: BorderSide(color: Colors.green, width: 2.0), // Bordure verte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Score $score', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton "Menu" est pressé.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Fond du bouton en vert
                elevation: 2.0, // Ombre
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Coins arrondis
                ),
              ),
            
              child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 26.0),
                child: Text('Menu', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
