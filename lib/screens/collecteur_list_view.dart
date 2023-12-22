import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';
import 'package:smart_waste_manager_mobile_app/services/collecteur_service.dart';

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
                return ListTile(
                  title: Text(collecteursData[index].nom ?? ''),
                  // Ajoutez d'autres éléments d'interface utilisateur en fonction des données du collecteur
                );
              },
            );
          }
        },
      ),
    );
  }
}
