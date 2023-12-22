import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';
import 'package:smart_waste_manager_mobile_app/services/collecteur_service.dart';
import 'package:smart_waste_manager_mobile_app/widgets/collecteur_item.dart';

class CollecteurListView extends StatefulWidget {
  @override
  _CollecteurListViewState createState() => _CollecteurListViewState();
}

class _CollecteurListViewState extends State<CollecteurListView> {
  final CollecteurService collecteurService = CollecteurService();
  late Future<List<Collecteur>> collecteurs; // Utilisation de Future pour la gestion asynchrone

  @override
  void initState() {
    super.initState();
    collecteurs = getCollecteurs(); // Appel de la méthode pour récupérer les collecteurs
  }

  // Méthode pour récupérer les collecteurs
  Future<List<Collecteur>> getCollecteurs() async {
    try {
      List<Collecteur> result = await collecteurService.getAllCollecteurs();
      print('Liste des collecteurs : $result');
      return result;
    } catch (e) {
      print('Erreur lors de la récupération des collecteurs : $e');
      throw e; // Renvoie l'erreur pour la gestion future
    }
  }

  // Fonction pour gérer la suppression d'un collecteur
  Future<void> deleteCollecteur(String collecteurId) async {
    try {
      await collecteurService.deleteCollecteur(collecteurId);
      print('Collecteur supprimé avec succès');
      setState(() {
        // Mettez à jour la liste après la suppression
        collecteurs = getCollecteurs();
      });
    } catch (e) {
      print('Erreur lors de la suppression du collecteur : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Collecteurs'),
      ),
      body: FutureBuilder<List<Collecteur>>(
        future: collecteurs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur: ${snapshot.error}');
          } else {
            List<Collecteur> collecteursData = snapshot.data!;
            return ListView.builder(
              itemCount: collecteursData.length,
              itemBuilder: (context, index) {
                return CollecteurItem(
                  collecteur: collecteursData[index],
                  onDelete: deleteCollecteur, // Fournir la fonction onDelete
                );
              },
            );
          }
        },
      ),
    );
  }
}
