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
  static const LatLng destination = LatLng(37.4116, -122.07713);

  // static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  // static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    try {
      print("gggggoooooddd==============================================");
      currentLocation = await location.getLocation();
      print(currentLocation);
      print("yyyyyeeeessss==============================================");
    } on Exception {
      print("==============================================");
      print(Exception);
      currentLocation = null;
      print("==============================================");
    }

    location.onLocationChanged.listen((LocationData currentLocation1) {
      print(currentLocation1.latitude);
      print(currentLocation1.longitude);
      print("==============================================");
      setState(() {
        currentLocation = currentLocation1;
      });
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDNXk-PYESNlN5Cm7NPEoGUg_WQS-xFdc4', // Remplacez par votre propre clé API Google Maps
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
        setState(() {});
      } else {
        print('Aucun point trouvé.');
      }
    } catch (e) {
      print('Erreur lors de la récupération des points de la route: $e');
    }
  }

  @override
  void initState() {
    super.initState();
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
          // Essayez une valeur inférieure à 10.5
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.black,
            points: polylineCoordinates,
          ),
        },
        markers: {
          Marker(
            markerId: const  MarkerId('currentLocation'),
            position: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
            infoWindow: const InfoWindow(
              title: 'Ma position actuelle',
            )
          ),
          const Marker(
            markerId: MarkerId('source'),
            position: sourceLocation,
            infoWindow: InfoWindow(
              title: 'sourceLocation',
            )
          ),
          const Marker(
            markerId: MarkerId('destination'),
            position: destination,
            infoWindow: InfoWindow(
              title: 'destination',
            )
          ),
        },
      ),
    );
  }
}
