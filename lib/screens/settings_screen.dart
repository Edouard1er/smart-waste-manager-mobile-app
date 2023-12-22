import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/screens/Bienvenu.dart';
import 'package:smart_waste_manager_mobile_app/screens/BienvenuPhon.dart';
import 'package:smart_waste_manager_mobile_app/screens/agentMatricule.dart';
import 'package:smart_waste_manager_mobile_app/screens/choisirQuartier.dart';
import 'package:smart_waste_manager_mobile_app/screens/home_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/statistiqueScreen.dart';
import 'package:smart_waste_manager_mobile_app/screens/ville_collection.dart';
import 'package:smart_waste_manager_mobile_app/widgets/confirmation_dialog_widget.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/next_collection_screen.dart';
import 'package:smart_waste_manager_mobile_app/widgets/widgetCllectMapInfo.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<WasteBin> wasteBins = [
      WasteBin(
          id: 1,
          latitude: 37.7749,
          longitude: -122.4214,
          fillLevel: 0.98,
          nextCollectionDate: DateTime.now(),
          status: ''),
      WasteBin(
          id: 2,
          latitude: 37.7839,
          longitude: -122.4214,
          fillLevel: 0.7,
          nextCollectionDate: DateTime.now(),
          status: ''),
      WasteBin(
          id: 3,
          latitude: 37.7839,
          longitude: -122.4218,
          fillLevel: 0.3,
          nextCollectionDate: DateTime.now(),
          status: ''),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Notifications'),
              subtitle: Text('Activer/désactiver les notifications'),
              trailing: Switch(
                value: true, // Remplacez par la vraie valeur de la notification
                onChanged: (bool value) {
                  // Ajoutez ici la logique pour activer/désactiver les notifications
                },
              ),
            ),
            ListTile(
              title: Text('Rappels'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NextCollectScreen()),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('VilleCollection'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) =>
                          VilleCollection(wasteBins: wasteBins)),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('Bienvenu'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) => Bienvenu()),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('Bienvenu Telephone'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) =>
                          BienvenuPhone()),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('Bienvenu Quartier'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) =>
                          ChoixQuartier()),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('Ajouter Agent'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) =>
                          AgentMatricule()),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('Statistique'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) => Statistique(wasteBins: wasteBins)),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            ListTile(
              title: Text('MapInfo'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                  MaterialPageRoute(
                      builder: (context) => CollectMapInfoWidget(
                            distance: '5km',
                            time: '5',
                            totalPoubelle: 6,
                            totalMaison: 7,
                            totalEndommage: 2,
                            score: 2,
                          )),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
              ListTile(
              title: Text('Statistique'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                  Navigator.of(context).pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                    MaterialPageRoute(builder: (context) => Statistique(wasteBins: wasteBins)),
                );
                // Ajoutez ici la logique pour naviguer vers l'écran de configuration des rappels
              },
            ),
            // Ajoutez d'autres options de paramètres ici
          ],
        ),
      ),
    );
  }
}
