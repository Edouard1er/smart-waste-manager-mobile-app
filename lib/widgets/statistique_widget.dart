import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:intl/intl.dart';
import 'package:smart_waste_manager_mobile_app/screens/MyProgressBar.dart';

class StatistiqueWidget extends StatelessWidget {
  final WasteBin wasteBin;

  StatistiqueWidget({required this.wasteBin});

  @override
  Widget build(BuildContext context) {
    
     // Couleur globale du texte
  
    // Formater la date au format "année_mois_jour"


    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.white, // Utiliser la couleur déterminée
      child: ListTile(
        contentPadding:
            EdgeInsets.all(0), // Supprimer le padding par défaut du ListTile
        // title: Text(
        //   'Waste Bin #${wasteBin.id}',
        //   textAlign: TextAlign.center, // Centrer le texte
        //   style: TextStyle(color: textColor), // Appliquer la couleur du texte
        // ),
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centrer les éléments dans la colonne
          children: [
            Text(
              'Status: ${wasteBin.status}',
              style:
                  TextStyle(color: Colors.black), // Appliquer la couleur du texte
            ),
          
            Text(
              'Fill Level: ${wasteBin.fillLevel}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Appliquer la couleur du texte
            ),
            MyProgressBar(percentage: 5)
          ],
        ),
        onTap: () {
          // Action when a waste bin is tapped
          // For example, navigate to details screen
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => BinDetailsScreen(bin: wasteBin)),
          // );
        },
      ),
    );
  }
}

