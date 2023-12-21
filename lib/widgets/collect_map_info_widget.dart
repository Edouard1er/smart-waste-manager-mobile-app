import 'package:flutter/material.dart';

class CollectMapInfoWidget extends StatelessWidget {
  final String distance;
  final String time;
  final int totalPoubelle;
  final int totalMaison;
  final int totalEndomage;
  final int score;

  CollectMapInfoWidget({
    required this.distance,
    required this.time,
    required this.totalPoubelle,
    required this.totalMaison,
    required this.totalEndomage,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Opaque (non-transparent)
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)), // Coins arrondis en haut
        border: Border.all(color: Colors.green, width: 2.0), // Bordure verte
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                ),
                child: Text('Distance $distance'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                ),
                child: Text('Temps $time'),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                ),
                child: Text('Total poubelle $totalPoubelle'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                ),
                child: Text('Total maison $totalMaison'),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                ),
                child: Text('Total endommagé $totalEndomage'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                ),
                child: Text('Score $score'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
