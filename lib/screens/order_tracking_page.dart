import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.0327188);
  static const LatLng destination = LatLng(37.3329383, -122.30600055);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      '', // Remplacez par votre propre clé API Google Maps
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving, // Décommentez cette ligne si vous souhaitez spécifier le mode de déplacement
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 10.5,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.red,
            points: polylineCoordinates,
          ),
        },
        markers: {
          Marker(
            markerId: MarkerId('source'),
            position: sourceLocation,
          ),
          Marker(
            markerId: MarkerId('destination'),
            position: destination,
          ),
        },
      ),
    );
  }
}
