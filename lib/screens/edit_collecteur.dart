import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';
import 'package:smart_waste_manager_mobile_app/services/collecteur_service.dart';

class EditCollecteurView extends StatefulWidget {
  final Collecteur collecteur;

  EditCollecteurView({required this.collecteur});

  @override
  _EditCollecteurViewState createState() => _EditCollecteurViewState();
}

class _EditCollecteurViewState extends State<EditCollecteurView> {
  final CollecteurService collecteurService = CollecteurService();
  late TextEditingController _matriculeController;
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _roleController;

  @override
  void initState() {
    super.initState();
    // Initialisez les contrôleurs avec les valeurs actuelles du collecteur
    _matriculeController = TextEditingController(text: widget.collecteur.matricule);
    _nomController = TextEditingController(text: widget.collecteur.nom);
    _prenomController = TextEditingController(text: widget.collecteur.prenom);
    _usernameController = TextEditingController(text: widget.collecteur.username);
    _passwordController = TextEditingController(text: widget.collecteur.password);
    _roleController = TextEditingController(text: widget.collecteur.role);
  }

  void _modifierCollecteur() async {
    String collecteurId = widget.collecteur.id ?? '';
    String matricule = _matriculeController.text;
    String nom = _nomController.text;
    String prenom = _prenomController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;
    String role = _roleController.text;

    if (matricule.isNotEmpty && nom.isNotEmpty && prenom.isNotEmpty && username.isNotEmpty && password.isNotEmpty && role.isNotEmpty) {
      try {
        // Créez un objet Map pour les données à mettre à jour
        Map<String, dynamic> data = {
          'matricule': matricule,
          'nom': nom,
          'prenom': prenom,
          'username': username,
          'password': password,
          'role': role,
        };

        Collecteur collecteurModifie = await collecteurService.updateCollecteur(collecteurId, data);
        // Traitez le collecteur modifié comme nécessaire
        print('Collecteur modifié : $collecteurModifie');
        Navigator.pop(context, collecteurModifie) ;// Revenir à la liste des collecteurs après la modification
      } catch (e) {
        print('Erreur lors de la modification du collecteur : $e');
      }
    } else {
      print('Veuillez remplir tous les champs pour modifier le collecteur.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier un Collecteur'),
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
              onPressed: _modifierCollecteur,
              child: Text('Modifier Collecteur'),
            ),
          ],
        ),
      ),
    );
  }
}
