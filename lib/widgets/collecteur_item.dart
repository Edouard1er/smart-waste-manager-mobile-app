import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';

class CollecteurItem extends StatelessWidget {
  final Collecteur collecteur;
  final Function(String) onDelete; // Fonction pour gérer la suppression

  CollecteurItem({required this.collecteur, required this.onDelete});

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
              onPressed: () {
                // Ajoutez la logique pour modifier le collecteur ici
                // par exemple, naviguez vers une page de modification
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Afficher une boîte de dialogue de confirmation
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Voulez-vous vraiment supprimer ce collecteur ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Fermer la boîte de dialogue
                          },
                          child: Text('Annuler'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await onDelete(collecteur.id!); // Appeler la fonction de suppression
                            Navigator.of(context).pop(); // Fermer la boîte de dialogue
                          },
                          child: Text('Supprimer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
