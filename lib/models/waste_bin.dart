class WasteBin {
  final int id;
  final double latitude;
  final double longitude;
  final double fillLevel;
  final DateTime nextCollectionDate;
  final String status;

  WasteBin({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.fillLevel,
    required this.nextCollectionDate,
    required  this.status,
  });

  get isDamaged => null;

  factory WasteBin.fromJson(Map<String, dynamic> json) {
    GpsCoordinates coordinates = convertGpsCoordinates(json['gps']);
    return WasteBin(
      id: json['_id'],
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
      fillLevel: json['historique']?.niveau_remplissage ?? 0.0,
      nextCollectionDate: json['nextCollectionDate'],
      status: 'OK'
    );
  }


}

class GpsCoordinates {
  final double latitude;
  final double longitude;

  GpsCoordinates({required this.latitude, required this.longitude});
}

GpsCoordinates convertGpsCoordinates(String gpsData) {
  // Supprimer les caractères indésirables et diviser en parties
  String cleanedGps = gpsData.replaceAll(RegExp(r'[^\w\s.]'), '');
  List<String> parts = cleanedGps.split(' ');

  // Extraire les parties de degrés et minutes
  double degreesLatitude = double.parse(parts[0].substring(0, 2));
  double minutesLatitude = double.parse(parts[0].substring(2, 4));

  double degreesLongitude = double.parse(parts[1].substring(0, 2));
  double minutesLongitude = double.parse(parts[1].substring(2, 4));

  // Calculer les coordonnées en décimales
  double latitude = degreesLatitude + minutesLatitude / 60;
  double longitude = degreesLongitude + minutesLongitude / 60;

  // Vérifier la direction N/S et E/W
  if (gpsData.contains('S')) {
    latitude = -latitude;
  }
  if (gpsData.contains('W')) {
    longitude = -longitude;
  }

  return GpsCoordinates(latitude: latitude, longitude: longitude);
}



