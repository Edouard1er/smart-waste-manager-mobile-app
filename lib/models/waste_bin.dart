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
}
