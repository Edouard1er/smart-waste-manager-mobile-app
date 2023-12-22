import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/agentMatricule.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';

class ChoixQuartier extends StatefulWidget {

  ChoixQuartier();

  @override
  _ChoixQuartierState createState() => _ChoixQuartierState();
}

class _ChoixQuartierState extends State<ChoixQuartier> {
  String? selectedValue; // Déclarez la variable selectedValue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir ta ville par défaut'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SMART WAB',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 190.0), // Espace

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Choisir Un Quartier',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            Container(
              width: 200.0,
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
                  items: <String>['Olmeta di tuda', 'Rapale', 'Santu petro di tenda', 'Sorbo ocagnano']
                      .map<DropdownMenuItem<String>>((String valuee) {
                    return DropdownMenuItem<String>(
                      value: valuee,
                      child: Text(valuee),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 30.0), // Espace

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: Size(200.0, 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgentMatricule()),
                );
                // Action du bouton "AGENT"
                // Vous pouvez définir le comportement souhaité ici
              },
              child: Text(
                'AGENT',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
