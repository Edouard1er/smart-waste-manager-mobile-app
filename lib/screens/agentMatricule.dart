import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';

class AgentMatricule extends StatelessWidget {
  final List<WasteBin> wasteBins;

  AgentMatricule({required this.wasteBins});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enregistrer ton nemuro d\'Agent'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SMART WAB',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 180.0), // Espace
          
            Container(
              width: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_add,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Entrer Ton Matricule',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.0), // Espace

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade500,
                fixedSize: Size(200.0,
                    50.0), // Ajustez la largeur et la hauteur selon vos préférences
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Ajustez le rayon selon vos préférences
                  side: BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () {
                // Action du bouton "AGENT"
                // Vous pouvez définir le comportement souhaité ici
              },
              child: Text(
                'AJOUTER',
                style:
                    TextStyle(color: Colors.white), // Couleur de texte blanche
              ),
            ),
          ],
        ),
      ),
    );
  }
}
