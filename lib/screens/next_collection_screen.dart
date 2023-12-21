import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
import 'package:smart_waste_manager_mobile_app/widgets/waste_bin_collect_widget.dart';

class NextCollectScreen extends StatelessWidget {
  final List<WasteBin> wasteBins;

  NextCollectScreen({required this.wasteBins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Collection'),
      ),
      body: ListView.builder(
        itemCount: wasteBins.length,
        itemBuilder: (context, index) {
          return WasteBinWidget(wasteBin: wasteBins[index]);
        },
      ),
    );
  }
}
