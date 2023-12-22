import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';

class CollecteurItem extends StatelessWidget {
  final Collecteur collecteur;
  final Function(String) onDelete;
  final VoidCallback onEdit; // Fonction pour gérer l'édition

  CollecteurItem({required this.collecteur, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(collecteur.nom ?? ''),
        subtitle: Text(collecteur.prenom ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Afficher une boîte de dialogue de confirmation pour la suppression (comme précédemment)
              },
            ),
          ],
        ),
      ),
    );
  }
}
