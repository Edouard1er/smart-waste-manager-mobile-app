import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/next_collection_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/report_screen.dart';
import 'package:smart_waste_manager_mobile_app/screens/routes_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  List<Marker> _markers = [];

  List<WasteBin> wasteBins = [
    WasteBin(id: 1, latitude: 37.7749, longitude: -122.4214, fillLevel: 0.7, nextCollectionDate: DateTime.now(), status: ''),
    WasteBin(id: 2, latitude: 37.7839, longitude: -122.4214, fillLevel: 0.5, nextCollectionDate: DateTime.now(), status: ''),
    WasteBin(id: 3, latitude: 37.7839, longitude: -122.4218, fillLevel: 0.3, nextCollectionDate: DateTime.now(), status: ''),
  ];

  @override
  void initState() {
    super.initState();
    _generateMarkers();
  }

  void _generateMarkers() {
    _markers.clear();
    for (var bin in wasteBins) {
      _markers.add(
        Marker(
          markerId: MarkerId(bin.id.toString()),
          position: LatLng(bin.latitude, bin.longitude),
          icon: _getMarkerIcon(bin.fillLevel),
          onTap: () {
            _showBinDetailsDialog(bin);
          },
        ),
      );
    }
  }

  BitmapDescriptor _getMarkerIcon(double fillLevel) {
    if (fillLevel > 0.5) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Carte Interactive'),
      // ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },
        markers: Set<Marker>.from(_markers),
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFiltersDialog();
        },
        child: Icon(Icons.filter_list),
      ),
    );
  }

  Future<void> _showFiltersDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filtres'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CheckboxListTile(
                  title: Text('Poubelles pleines'),
                  value: true,
                  onChanged: (bool? value) {
                    // Mettez à jour les marqueurs en fonction du filtre
                  },
                ),
                CheckboxListTile(
                  title: Text('Poubelles vides'),
                  value: true,
                  onChanged: (bool? value) {
                    // Mettez à jour les marqueurs en fonction du filtre
                  },
                ),
                // Ajoutez d'autres options de filtre ici
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showBinDetailsDialog(WasteBin bin) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Poubelle #${bin.id}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Niveau de remplissage: ${bin.fillLevel}'),
                Text('Date de la prochaine collecte: ${bin.nextCollectionDate}'),
                Text('Statut: ${bin.status}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
            TextButton(
              onPressed: () {
                // Ouvrir ReportScreen
                Navigator.of(context).pop(); // Fermer la boîte de dialogue actuelle
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextCollectScreen(wasteBins: wasteBins)),
                );
              },
              child: Text('Signaler quelque chose'),
            ),
          ],
        );
      },
    );
  }

}