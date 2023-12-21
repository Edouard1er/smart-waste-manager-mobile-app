import 'package:flutter/material.dart';

class MyProgressBar extends StatelessWidget {
  final int percentage;

  MyProgressBar({this.percentage = 50});

  Color _getColorForPercentage(int percentage) {
    if (percentage >= 97) {
      return Colors.red;
    } else if (percentage >= 50) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remplissage: $percentage%',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8), // Ajustez l'espacement selon vos besoins

        Container(
          width: 170.0, // Définissez la largeur du conteneur parent
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                10.0), // Ajustez le rayon pour rendre les extrémités arrondies
            child: LinearProgressIndicator(
              value: percentage / 100, // La valeur doit être entre 0 et 1
              minHeight: 20,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getColorForPercentage(percentage),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
