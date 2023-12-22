import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:intl/intl.dart';
import 'package:smart_waste_manager_mobile_app/screens/order_tracking_page.dart';

class WasteBinWidget extends StatelessWidget {
  final WasteBin wasteBin;

  WasteBinWidget({required this.wasteBin});

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Color textColor; // Couleur globale du texte
    Color dateColor;
    // Déterminer la couleur en fonction du niveau de remplissage
    if (wasteBin.fillLevel >= 0.7) {
      cardColor = Colors.red;
      textColor = Colors.white; // Texte en blanc lorsque le niveau est élevé
      dateColor = Colors.white;
    } else if (wasteBin.fillLevel >= 0.5 && wasteBin.fillLevel < 0.97) {
      cardColor = Colors.yellow;
      textColor = Colors.black; // Texte en noir lorsque le niveau est moyen
      dateColor = Colors.green;
    } else {
      cardColor = Colors.white;
      textColor = Colors.black; // Texte en noir lorsque le niveau est faible
      dateColor = Colors.green;
    }

    // Formater la date au format "année_mois_jour"
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(wasteBin.nextCollectionDate);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: cardColor, // Utiliser la couleur déterminée
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
              '${formattedDate}',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize:25 ,color: dateColor), // Date en vert
            ),
            Text(
              'Niveau de remplissage moyen des poubelles: ${wasteBin.fillLevel * 100.0}%',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor), // Appliquer la couleur du texte
            ),

          ],
        ),
        onTap: () {
          // Action when a waste bin is tapped
          // For example, navigate to details screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderTrackingPage()),
          );
        },
      ),
    );
  }
}


