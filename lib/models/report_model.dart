class Report {
  final String id;
  final String name;
  final String testId;
  final String createdAt;

  Report({
    required this.id,
    required this.name,
    required this.testId,
    required this.createdAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id']??'',
      name: json['name']??'',
      testId: json['testId']??'',
      createdAt: json['created_at']??'',
    );
  }
}