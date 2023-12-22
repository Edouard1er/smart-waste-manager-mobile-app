import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController _descriptionController = TextEditingController();
  List<String> _photos = [];
  String? selectedValue;
  bool option1Value = false;
  bool option2Value = false;
  bool option3Value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signaler un problème'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [

            SizedBox(height: 25.0),
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
                      items: <String>['Defectueux', 'Correct', "Endommagé"]
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
            SizedBox(height: 5.0),
            // Liste de CheckBox
            CheckboxListTile(
              title: Text('Insalubrité'),
              value: option1Value,
              onChanged: (bool? value) {
                setState(() {
                  option1Value = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Encombrants'),
              value: option2Value,
              onChanged: (bool? value) {
                setState(() {
                  option2Value = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Présence animale"),
              value: option3Value,
              onChanged: (bool? value) {
                setState(() {
                  option3Value = value!;
                });
              },
            ),
            SizedBox(height: 0.0),

            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description du problème'),
              maxLines: 3,
            ),
            SizedBox(height: 1.0),
            Text('Ajouter des photos pour clarification'),
            SizedBox(height: 0.0),
            _buildPhotoList(),
            SizedBox(height: 0.0),
            ElevatedButton(
              onPressed: _takePhoto,
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Couleur de l'arrière-plan du bouton
                onPrimary: Colors.black, // Couleur du texte
                side: BorderSide(color: Colors.green), // Bordure verte
              ),
              child: Text('Prendre une photo'),
            ),
            SizedBox(height: 1.0),
            ElevatedButton(
              onPressed: _submitReport,
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Couleur de l'arrière-plan du bouton
                onPrimary: Colors.white, // Couleur du texte
              ),
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
