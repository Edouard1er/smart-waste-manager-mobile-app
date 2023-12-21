import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/screens/settings_screen.dart';

class Statistique extends StatelessWidget {
  final List<WasteBin> wasteBins;

  Statistique({required this.wasteBins});

  @override
  Widget build(BuildContext context) {
    // Calculez le nombre total de poubelles et le nombre de poubelles endommagées
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistique'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Center(
              child: Text(
                'SMART WAB',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 90.0),
            Text('Nombre Poubelle : 90'),
            SizedBox(height: 16.0),
            Text('Nombre Poubelle Endommager: 40 '),
            SizedBox(height: 16.0),
            // Ajoutez ici le graphique (par exemple, PieChart)
            Container(
              height: 300.0,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: const Color(0xFF66BB6A),
                      title: '90',
                      radius: 100.0,
                      titleStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      color: const Color(0xFFE57373),
                      title: '40',
                      radius: 80.0,
                      titleStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
