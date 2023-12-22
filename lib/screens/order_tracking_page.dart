import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../widgets/collect_map_info_widget.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> destinations = [
    LatLng(37.4116, -122.07713),
    LatLng(37.42, -122.08),
    LatLng(37.43, -122.09),
    // Ajoutez d'autres destinations au besoin
  ];

  List<Polyline> polylines = [];
  LocationData? currentLocation;
  Location location = Location();

  void getCurrentLocation() async {
    try {
      currentLocation = await location.getLocation();
      print('Current Location: ${currentLocation?.latitude}, ${currentLocation?.longitude}');
    } catch (e) {
      print('Erreur lors de la récupération de la localisation: $e');
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData currentLocation1) {
      print('Real-time Location: ${currentLocation1.latitude}, ${currentLocation1.longitude}');
      setState(() {
        currentLocation = currentLocation1;
      });
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    try {
      for (int i = 0; i < destinations.length - 1; i++) {
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          'AIzaSyDNXk-PYESNlN5Cm7NPEoGUg_WQS-xFdc4',
          PointLatLng(destinations[i].latitude, destinations[i].longitude),
          PointLatLng(destinations[i + 1].latitude, destinations[i + 1].longitude),
          travelMode: TravelMode.driving,
        );

        if (result.points.isNotEmpty) {
          List<LatLng> currentPolylineCoordinates = [];
          result.points.forEach((PointLatLng point) {
            currentPolylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });

          polylines.add(Polyline(
            polylineId: PolylineId('route$i'),
            color: Colors.black,
            points: currentPolylineCoordinates,
          ));
        } else {
          print('Aucun point trouvé pour l\'itinéraire $i.');
        }
      }

      setState(() {});
    } catch (e) {
      print('Erreur lors de la récupération des points de l\'itinéraire: $e');
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
        title: Text('Route optimale'),
      ),
      body:
      Stack(
      children: [
      currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        zoomGesturesEnabled: true,
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
        polylines: Set<Polyline>.from(polylines),
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
          for (int i = 0; i < destinations.length; i++)
            Marker(
              markerId: MarkerId('destination$i'),
              position: destinations[i],
              infoWindow: InfoWindow(
                title: 'destination $i',
              ),
            ),
        },
        zoomControlsEnabled: true,

      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: CollectMapInfoWidget(
          distance: '5km',
          time: '5',
          totalPoubelle: 6,
          totalMaison: 7,
          totalEndomage: 2,
          score: 2,
        ),
      ),
      ],
      )
    );
  }
}
