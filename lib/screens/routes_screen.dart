import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';

class RoutesScreen extends StatefulWidget {
  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  late GoogleMapController mapController;
  Set<Marker> _markers = Set();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  List<WasteBin> wasteBins = [
    WasteBin(id: 1, latitude: 37.7749, longitude: -122.4194, fillLevel: 0.4, nextCollectionDate: DateTime.now(), status: ''),
    WasteBin(id: 2, latitude: 37.7755, longitude: -122.4884, fillLevel: 0.6, nextCollectionDate: DateTime.now(), status: ''),
    WasteBin(id: 3, latitude: 37.7855, longitude: -122.3284, fillLevel: 0.6, nextCollectionDate: DateTime.now(), status: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Bins Routes'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12.0,
        ),
        markers: _markers,
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            points: polylineCoordinates,
            width: 5,
          ),
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      // Add markers for waste bins
      for (var bin in wasteBins) {
        _markers.add(
          Marker(
            markerId: MarkerId(bin.id.toString()),
            position: LatLng(bin.latitude, bin.longitude),
            infoWindow: InfoWindow(
              title: 'Waste Bin #${bin.id}',
            ),
          ),
        );
      }

      // Get optimal route
      _getOptimalRoute();
    });
  }

  Future<void> _getOptimalRoute() async {
    for (int i = 0; i < wasteBins.length - 1; i++) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'your_google_maps_api_key',
        PointLatLng(wasteBins[i].latitude, wasteBins[i].longitude),
        PointLatLng(wasteBins[i + 1].latitude, wasteBins[i + 1].longitude),
        travelMode: TravelMode.driving,
      );

      // Draw segment of the route on the map
      _updatePolyline(result);
    }
  }

  void _updatePolyline(PolylineResult result) {
    setState(() {
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
    });
  }
}



