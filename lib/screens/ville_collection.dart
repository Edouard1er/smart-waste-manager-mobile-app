import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';
import 'package:smart_waste_manager_mobile_app/widgets/waste_bin_villeCollect_widget.dart';

class VilleCollection extends StatelessWidget {
  final List<WasteBin> wasteBins;

  VilleCollection({required this.wasteBins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quartier'),
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
          return WasteBinWidgetVilleCollect(wasteBin: wasteBins[index]);
        },
      ),
    );
  }
}
