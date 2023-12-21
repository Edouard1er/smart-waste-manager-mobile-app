import 'package:flutter/material.dart';

class MyProgressBar extends StatelessWidget {
  final int percentage;

  MyProgressBar({this.percentage = 50});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remplissage: $percentage%',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        LinearProgressIndicator(
          value: percentage / 100, // La valeur doit être entre 0 et 1
          minHeight: 10,
        ),
      ],
    );
  }
}