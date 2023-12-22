import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/home_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/ville_collection.dart';

class AgentMatricule extends StatelessWidget {

  List<WasteBin> wasteBins = [

    WasteBin(id: 1, latitude: 37.7749, longitude: -122.4214, fillLevel: 1.0, nextCollectionDate: DateTime.now(), status: 'Correct'),
    WasteBin(id: 2, latitude: 37.7839, longitude: -122.4214, fillLevel: 0.5, nextCollectionDate: DateTime.now(), status: 'Correct'),
    WasteBin(id: 3, latitude: 34.7839, longitude: -122.4218, fillLevel: 0.3, nextCollectionDate: DateTime.now(), status: 'Endommagé'),
    WasteBin(id: 4, latitude: 37.7749, longitude: -122.4114, fillLevel: 0.7, nextCollectionDate: DateTime.now(), status: 'Correct'),
    WasteBin(id: 5, latitude: 37.7839, longitude: -122.8414, fillLevel: 0.5, nextCollectionDate: DateTime.now(), status: 'Endommagé'),
    WasteBin(id: 6, latitude: 37.7839, longitude: -122.4518, fillLevel: 0.3, nextCollectionDate: DateTime.now(), status: 'Correct'),
  ];

  AgentMatricule();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enregistrer ton nemuro d\'Agent'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Go back to the previous screen
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 180.0), // Espace

              Container(
                width: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_add,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Entrer Ton Matricule',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.0), // Espace

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade500,
                  fixedSize: Size(200.0,
                      50.0), // Ajustez la largeur et la hauteur selon vos préférences
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Ajustez le rayon selon vos préférences
                    side: BorderSide(color: Colors.green),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  // Action du bouton "AGENT"
                  // Vous pouvez définir le comportement souhaité ici
                },
                child: Text(
                  'VALIDER',
                  style:
                  TextStyle(color: Colors.white), // Couleur de texte blanche
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
