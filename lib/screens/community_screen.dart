import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> discussions = [
    'Comment réduire le gaspillage alimentaire ?',
    'Idées pour recycler les produits électroniques',
    'Questions sur la collecte sélective',
    // Ajoutez d'autres discussions ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communauté / Forum'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: discussions.length,
          itemBuilder: (context, index) {
            return _buildDiscussionCard(discussions[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ajoutez ici la logique pour créer une nouvelle discussion
          // ou naviguer vers l'écran de création de discussion.
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildDiscussionCard(String discussion) {
    return Card(
      child: ListTile(
        title: Text(discussion),
        onTap: () {
          // Ajoutez ici la logique pour naviguer vers l'écran de détails de la discussion
        },
      ),
    );
  }
}

