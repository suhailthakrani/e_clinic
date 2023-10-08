import '../models/doctor_model.dart';
import '../models/general_models.dart';
import '../models/patient_model.dart';

class AppointmentModel {
  String id = '';
  DateTime date = DateTime.now();
  String time = '';
  int charges = 0;
  String type = '';
  String patientName = '';
  String message = '';
  Doctor doctor = Doctor.empty();
  String doctorId = '';
  Patient patient = Patient.empty();
  String patientId = '';
  String status = 'PENDING';
  bool completed = false;
  String payment_status = 'PENDING';
  List<Transactions> transactions = [];
  List<Prescription> prescription = [];

  AppointmentModel({
    this.id = '',
    required this.date,
    this.time = '',
    this.charges = 0,
    this.type = '',
    this.patientName = '',
    this.message = '',
    required this.doctor,
    this.doctorId = '',
    required this.patient,
    this.patientId = '',
    this.status = 'PENDING',
    this.completed = false,
    this.payment_status = 'PENDING',
    List<Transactions>? transactions,
    List<Prescription>? prescription,
  }) {
    this.transactions = transactions ?? [];
    this.prescription = prescription ?? [];
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      time: json['time'] ?? '',
      charges: json['charges'] ?? 0,
      type: json['type'] ?? '',
      patientName: json['patient_ame'] ?? '',
      message: json['message'] ?? '',
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
      patient: Patient.fromJson(json['Patient']),
      patientId: json['patientId'] ?? '',
      status: json['status'] ?? 'PENDING',
      completed: json['completed'] ?? false,
      payment_status: json['payment_status'] ?? 'PENDING',
      transactions: (json['Transactions'] as List<dynamic>?)
              ?.map((e) => Transactions.fromJson(e))
              .toList() ??
          [],
      prescription: (json['Prescription'] as List<dynamic>?)
              ?.map((e) => Prescription.fromJson(e))
              .toList() ??
          [],
    );
  }
  AppointmentModel.empty()
      : id = '',
        date = DateTime.now(),
        time = '',
        charges = 0,
        type = '',
        patientName = '',
        message = '',
        doctor = Doctor.empty(),
        doctorId = '',
        patient = Patient.empty(),
        patientId = '',
        status = 'PENDING',
        completed = false,
        payment_status = 'PENDING',
        transactions = [],
        prescription = [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'time': time,
      'charges': charges,
      'type': type,
      'patient_ame': patientName,
      'message': message,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
      'Patient': patient.toJson(),
      'patientId': patientId,
      'status': status,
      'completed': completed,
      'payment_status': payment_status,
      'Transactions': transactions.map((e) => e.toJson()).toList(),
      'Prescription': prescription.map((e) => e.toJson()).toList(),
    };
  }
}

class Appointment {
  String id = '';
  String patientName = '';
  String date = '';
  String time = '';
  String type = '';
  int charges = 0;
  String message = '';
  String image = '';
  bool completed = false;

  Appointment({
    required this.id,
    required this.patientName,
    required this.date,
    required this.time,
    required this.type,
    required this.charges,
    required this.message,
    required this.image,
    required this.completed,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] ?? "",
      patientName: json['patient_name'] ?? "",
      date: json['date'] ?? "",
      time: json['time'] ?? "",
      type: json['type'] ?? "",
      charges: json['charges'] ?? 0,
      message: json['message'] ?? "",
      image: json['image'] ?? "",
      completed: (json['id'] ?? '').isNotEmpty,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_name': patientName,
      'date': date,
      'time': time,
      'type': type,
      'charges': charges,
      'message': message,
      'image': image,
    };
  }
}
