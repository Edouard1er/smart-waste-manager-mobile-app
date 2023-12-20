class Report {
  final int id;
  final int userId;
  final int wasteBinId;
  final String issueType;
  final String description;
  final DateTime reportDateTime;
  final String status;

  Report({
    required this.id,
    required this.userId,
    required this.wasteBinId,
    required this.issueType,
    required this.description,
    required this.reportDateTime,
    required this.status,
  });
}
