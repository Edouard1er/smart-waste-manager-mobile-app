import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/widgets/confirmation_dialog_widget.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Notifications'),
              subtitle: Text('Activer/désactiver les notifications'),
              trailing: Switch(
                value: true,  // Remplacez par la vraie valeur de la notification
                onChanged: (bool value) {
                  // Ajoutez ici la logique pour activer/désactiver les notifications
                },
              ),
            ),
            ListTile(
              title: Text('Rappels'),
              subtitle: Text('Configurer les rappels de collecte'),
              onTap: () {
                showConfirmationDialog(
                  context,
                  'Succès',
                  'Votre action a été effectuée avec succès.',
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
