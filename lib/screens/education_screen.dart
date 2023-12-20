import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Éducation et Sensibilisation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildRecyclingTips(),
            SizedBox(height: 16.0),
            _buildLocalInitiatives(),
            SizedBox(height: 16.0),
            _buildInteractiveLearning(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecyclingTips() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conseils de Recyclage',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Séparez vos déchets recyclables et non recyclables.',
            ),
            Text(
              '2. Réduisez l\'utilisation de plastique en optant pour des alternatives durables.',
            ),
            Text(
              '3. Recyclez les appareils électroniques de manière responsable.',
            ),
            // Ajoutez d'autres conseils ici
          ],
        ),
      ),
    );
  }

  Widget _buildLocalInitiatives() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Initiatives Locales',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Découvrez les initiatives locales pour la gestion durable des déchets.',
            ),
            Text(
              'Participez aux événements communautaires pour un environnement plus propre.',
            ),
            // Ajoutez d'autres informations sur les initiatives locales ici
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveLearning() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apprentissage Interactif',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Participez à nos quiz sur la gestion des déchets et testez vos connaissances.',
            ),
            ElevatedButton(
              onPressed: () {
                // Intégrez ici la navigation vers l'écran de quiz
              },
              child: Text('Commencer le Quiz'),
            ),
            // Ajoutez d'autres modules d'apprentissage interactifs ici
          ],
        ),
      ),
    );
  }
}

