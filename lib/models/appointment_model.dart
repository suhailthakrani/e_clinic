import 'dart:developer';

import 'package:intl/intl.dart';

import '../models/doctor_model.dart';

class AppointmentModel {
  String id = '';
  DateTime date = DateTime.now();
  String time = '';
  int charges = 0;
  String type = '';
  String patientName = '';
  String message = '';
  String doctorId = '';

  AppointmentModel({
    required this.id ,
    required this.date,
    required this.time ,
    required this.type ,
    required this.patientName ,
    required this.message ,
    required this.doctorId ,
    
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      time: json['time'] ?? '',
      // charges: json['charges'] ?? 0,
      type: json['type'] ?? '',
      patientName: json['patient_ame'] ?? '',
      message: json['message'] ?? '',
      // doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
      // patient: Patient.fromJson(json['Patient']),
      // patientId: json['patientId'] ?? '',
      // status: json['status'] ?? 'PENDING',
      // completed: json['completed'] ?? false,
      // payment_status: json['payment_status'] ?? 'PENDING',
      // transactions: (json['Transactions'] as List<dynamic>?)
      //         ?.map((e) => Transactions.fromJson(e))
      //         .toList() ??
      //     [],
      // prescription: (json['Prescription'] as List<dynamic>?)
      //         ?.map((e) => Prescription.fromJson(e))
      //         .toList() ??
      //     [],
    );
  }
  AppointmentModel.empty();

  Map<String, String> toJson() {
    String formattedDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(date.toUtc());
    log("====================${formattedDateTime}");
    return {
      // 'id': id,
      'doctorId': doctorId,
      'patient_name': patientName,
      'date': '${formattedDateTime}Z',
      'time': time,
      // 'charges': charges,
      'appointment_type': type,
      
      'message': message,
      // 'doctorId': doctor.id,
      
      // 'Patient': patient.toJson(),
      // 'patientId': patientId,
      // 'status': status,
      // 'completed': completed,
      // 'payment_status': payment_status,
      // 'Transactions': transactions.map((e) => e.toJson()).toList(),
      // 'Prescription': prescription.map((e) => e.toJson()).toList(),
    };
  }
}

