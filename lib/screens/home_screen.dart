import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Waste Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bienvenue dans Smart Waste Manager',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            // Affichez des informations pertinentes ici, par exemple :
            Text(
              'Fréquence de collecte du jour : Quotidienne',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Conseil du jour : Réduisez votre empreinte carbone en recyclant vos déchets.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de la carte ou une autre fonctionnalité
                // En utilisant Navigator.push
              },
              child: Text('Afficher la carte des poubelles'),
            ),
          ],
        ),
      ),
    );
  }
}