// import 'package:e_clinic/models/lab_model.dart';

// class TestModel {
//   final String id ;
//   final String name ;
//   final String description ;
//   final String labId ;
//   final String patientId ;
//   final String createdAt ;
//   final List<Report> reports;

//   TestModel({
//     this.id = '',
//     this.name = '',
//     this.description = '',
//     this.labId = '',
//     this.patientId = '',
//     this.createdAt = '',
//     this.reports = const [],
//   });

//   TestModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'] ?? '',
//         name = json['name'] ?? '',
//         description = json['description'] ?? '',
//         labId = json['labId'] ?? '',
//         patientId = json['patientId'] ?? '',
//         createdAt = json['createdAt'] ?? '',
//         reports = (json['reports'] ?? []).map((e) => Report(
//             id: e['id'] ?? '',
//             name: e['name'] ?? '',
//             test: e['test'] ?? '',
//             testId: e['testId'] ?? '',
//             createdAt: e['createdAt'] ?? ''));


//   Map<String, dynamic> toJson() {
//     return {
//       'id':id,
//       'name':name,
//       'description':description,
//       'labId':labId,
//       'patientId':patientId,
//       'createdAt': createdAt,
//       'reports': reports.map((e) => e.toJson()).toList(),
//     };
//   }
// }

// class Report {
//   String id = '';
//   String name = '';
//   String testId = '';
//   String createdAt = '';

//   Report.empty();

//   Report({
//     required this.id,
//     required this.name,
//     required this.testId,
//     required this.createdAt,
//   });

//   Report.fromJson(Map<String, dynamic> json)
//       : id = json['id'] ?? '',
//         name = json['name'] ?? '',
//         test = TestModel.fromJson(json['test'] ?? {}),
//         testId = json['testId'] ?? '',
//         createdAt = json['createdAt'] ?? '';

//   Map<String, dynamic> toJson() {
//     return {
//       'id':id,
//       'name':name,
//       'test':test.toString(),
//       'testId':testId,
//       'createdAt':createdAt,
//     };
//   }


// }
