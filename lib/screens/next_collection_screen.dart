import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';
import 'package:smart_waste_manager_mobile_app/widgets/waste_bin_collect_widget.dart';

class NextCollectScreen extends StatelessWidget {
  List<WasteBin> wasteBins = [

    WasteBin(id: 1, latitude: 37.7749, longitude: -122.4214, fillLevel: 0.7, nextCollectionDate: DateTime.now(), status: 'Correct'),
    WasteBin(id: 2, latitude: 37.7839, longitude: -122.4214, fillLevel: 0.5, nextCollectionDate: DateTime.now(), status: 'Correct'),
    WasteBin(id: 3, latitude: 34.7839, longitude: -122.4218, fillLevel: 0.3, nextCollectionDate: DateTime.now(), status: 'très sal'),
    WasteBin(id: 4, latitude: 37.7749, longitude: -122.4114, fillLevel: 0.7, nextCollectionDate: DateTime.now(), status: 'Endommagé'),
    WasteBin(id: 5, latitude: 37.7839, longitude: -122.8414, fillLevel: 0.5, nextCollectionDate: DateTime.now(), status: 'Correct'),
    WasteBin(id: 6, latitude: 37.7839, longitude: -122.4518, fillLevel: 0.3, nextCollectionDate: DateTime.now(), status: 'Correct'),
  ];

  NextCollectScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collectes'),
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
        onPressed: () {
  // Action lorsque le bouton de retour est pressé
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsScreen()),
  );
},

        ),
      ),
      body: ListView.builder(
        itemCount: wasteBins.length,
        itemBuilder: (context, index) {
          return WasteBinWidget(wasteBin: wasteBins[index]);
        },
      ),
    );
  }
}

