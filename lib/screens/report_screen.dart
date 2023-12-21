import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController _descriptionController = TextEditingController();
  List<String> _photos = [];
  String? selectedValue;
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
            Center(
              child: Text(
                'SMART WAB',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Etat :',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10.0), // Espace entre les deux éléments
                Container(
                  width: 290.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue =
                              newValue; // Mettez à jour la valeur sélectionnée
                        });
                      },
                      items: <String>['Endommager', 'Option 2', 'Option 3']
                          .map<DropdownMenuItem<String>>((String valuee) {
                        return DropdownMenuItem<String>(
                          value: valuee,
                          child: Text(valuee),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),

            
            SizedBox(height: 50.0),
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
