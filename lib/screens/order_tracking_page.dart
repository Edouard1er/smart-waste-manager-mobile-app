import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.4221, -122.0852);
  static const LatLng middle = LatLng(37.4177903, -122.0781);
  static const LatLng destination = LatLng(37.4116, -122.07713);


  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  // Initialiser la classe Location
  Location location = Location();

  // Fonction pour récupérer la localisation actuelle
  void getCurrentLocation() async {
    try {
      // Récupérer la localisation actuelle
      currentLocation = await location.getLocation();
      print('Current Location: ${currentLocation?.latitude}, ${currentLocation?.longitude}');
    } catch (e) {
      print('Erreur lors de la récupération de la localisation: $e');
      currentLocation = null;
    }

    // Écouter les changements de localisation en temps réel
    location.onLocationChanged.listen((LocationData currentLocation1) {
      print('Real-time Location: ${currentLocation1.latitude}, ${currentLocation1.longitude}');
      // Mettez à jour la localisation actuelle
      setState(() {
        currentLocation = currentLocation1;
      });
    });
  }

  // Fonction pour récupérer les points de l'itinéraire entre la source et la destination
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    try {
      // Récupérer l'itinéraire entre la source et la destination
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDNXk-PYESNlN5Cm7NPEoGUg_WQS-xFdc4', // Remplacez par votre propre clé API Google Maps
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
      );

      // Vérifier s'il y a des points dans l'itinéraire
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          // Ajouter les points à la liste des coordonnées du Polyline
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
        // Mettre à jour l'affichage
        setState(() {});
      } else {
        print('Aucun point trouvé.');
      }
    } catch (e) {
      print('Erreur lors de la récupération des points de l\'itinéraire: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Appeler les fonctions d'initialisation
    getPolyPoints();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
          zoom: 14.0,
        ),
        // Afficher le Polyline sur la carte
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.black,
            points: polylineCoordinates,
          ),
        },
        // Afficher les marqueurs sur la carte
        markers: {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
            infoWindow: const InfoWindow(
              title: 'Ma position actuelle',
            ),
          ),
          const Marker(
            markerId: MarkerId('source'),
            position: sourceLocation,
            infoWindow: InfoWindow(
              title: 'sourceLocation',
            ),
          ),
          const Marker(
            markerId: MarkerId('destination'),
            position: destination,
            infoWindow: InfoWindow(
              title: 'destination',
            ),
          ),
        },
      ),
    );
  }
}
