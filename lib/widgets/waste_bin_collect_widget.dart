import 'package:flutter/material.dart';
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';

class WasteBinWidget extends StatelessWidget {
  final WasteBin wasteBin;

  WasteBinWidget({required this.wasteBin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        leading: Icon(Icons.delete),
        title: Text('Waste Bin #${wasteBin.id}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fill Level: ${wasteBin.fillLevel}'),
            Text('Next Collection Date: ${wasteBin.nextCollectionDate}'),
            Text('Status: ${wasteBin.status}'),
          ],
        ),
        onTap: () {
          // Action when a waste bin is tapped
          // For example, navigate to details screen
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => BinDetailsScreen(bin: wasteBin)),
          // );
        },
      ),
    );
  }
}
