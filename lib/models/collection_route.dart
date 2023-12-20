class CollectionRoute {
  final int id;
  final List<int> wasteBinIds;
  final DateTime startTime;
  final int collectorId;
  final String status;

  CollectionRoute({
    required this.id,
    required this.wasteBinIds,
    required this.startTime,
    required this.collectorId,
    required this.status,
  });
}
