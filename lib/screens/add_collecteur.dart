import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';
import 'package:smart_waste_manager_mobile_app/screens/collecteur_list_view.dart';
import 'package:smart_waste_manager_mobile_app/services/collecteur_service.dart';

class AddCollecteurView extends StatefulWidget {
  @override
  _AddCollecteurViewState createState() => _AddCollecteurViewState();
}

class _AddCollecteurViewState extends State<AddCollecteurView> {
  final CollecteurService collecteurService = CollecteurService();
  TextEditingController _matriculeController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _roleController = TextEditingController();

  void _ajouterCollecteur() async {
    String matricule = _matriculeController.text;
    String nom = _nomController.text;
    String prenom = _prenomController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;
    String role = _roleController.text;

    if (matricule.isNotEmpty && nom.isNotEmpty && prenom.isNotEmpty && username.isNotEmpty && password.isNotEmpty && role.isNotEmpty) {
      try {

        Map<String, dynamic> collecteurData = {
          'matricule': matricule,
          'nom': nom,
          'prenom': prenom,
          'username': username,
          'password': password,
          'role': role,
        };

        Collecteur nouveauCollecteur = await collecteurService.addCollecteur(
          collecteurData,
        );
        // Traitez le nouveau collecteur comme nécessaire
        print('Collecteur ajouté : $nouveauCollecteur');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CollecteurListView()),
        ); // Revenir à la liste des collecteurs après l'ajout
      } catch (e) {
        print('Erreur lors de l\'ajout du collecteur : $e');
      }
    } else {
      print('Veuillez remplir tous les champs pour ajouter le collecteur.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Collecteur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _matriculeController,
              decoration: InputDecoration(labelText: 'Matricule'),
            ),
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _prenomController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
            ),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(labelText: 'Rôle'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _ajouterCollecteur,
              child: Text('Ajouter Collecteur'),
            ),
          ],
        ),
      ),
    );
  }
}
