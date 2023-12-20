// import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';
//
// Future<void> _showBinDetailsDialog(WasteBin bin) async {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Détails de la Poubelle'),
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text('Niveau de remplissage: ${bin.fillLevel}'),
//             // Ajoutez d'autres détails de la poubelle ici
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Fermer'),
//           ),
//         ],
//       );
//     },
//   );
// }