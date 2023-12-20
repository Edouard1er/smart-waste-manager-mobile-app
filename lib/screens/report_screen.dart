import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController _descriptionController = TextEditingController();
  List<String> _photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signaler un Problème'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description du problème'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            Text('Ajouter des photos pour clarification'),
            SizedBox(height: 8.0),
            _buildPhotoList(),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _takePhoto,
              child: Text('Prendre une photo'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitReport,
              child: Text('Soumettre le Signalement'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoList() {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              _photos[index],
              height: 80.0,
              width: 80.0,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _takePhoto() {
    // Intégrez ici la logique pour prendre une photo
    // Vous pouvez utiliser des packages tels que image_picker
  }

  void _submitReport() {
    // Intégrez ici la logique pour soumettre le signalement
    String description = _descriptionController.text;
    // Envoyez la description et les photos au backend ou effectuez d'autres actions nécessaires
  }
}

