

import '../models/appointment_model.dart';
import '../models/doctor_model.dart';
import '../models/patient_model.dart';
import '../models/user_model.dart';




class Document {
  String id = '';
  String type = 'DEGREE';
  String name = '';
  Doctor doctor = Doctor.empty();
  String doctorId = '';

  Document({
    this.id = '',
    this.type = 'DEGREE',
    this.name = '',
    required this.doctor,
    this.doctorId = '',
  });

  Document.empty()
      : id = '',
        type = 'DEGREE',
        name = '',
        doctor = Doctor.empty(),
        doctorId = '';

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'] ?? '',
      type: json['type'] ?? 'DEGREE',
      name: json['name'] ?? '',
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
    };
  }
}

class Location {
  String id = '';
  String address = '';
  String city = '';
  String state = '';
  Doctor doctor = Doctor.empty();

  Location({
    this.id = '',
    this.address = '',
    this.city = '',
    this.state = '',
    required this.doctor,
  });

  Location.empty()
      : id = '',
        address = '',
        city = '',
        state = '',
        doctor = Doctor.empty();

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      doctor: json['Doctor'] != null ? Doctor.fromJson(json['Doctor']) : Doctor.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'city': city,
      'state': state,
      'Doctor': doctor.toJson(),
    };
  }
}

class Schedule {
  String id = '';
  String day = '';
  String startTime = '';
  String endTime = '';
  String? break_start;
  String? break_end;
  int buffer = 0;
  bool is_active = false;
  int appointment_interval = 0;
  late Doctor doctor;
  String doctorId = '';

  Schedule({
    this.id = '',
    this.day = '',
    this.startTime = '',
    this.endTime = '',
    this.break_start,
    this.break_end,
    this.buffer = 0,
    this.is_active = false,
    this.appointment_interval = 0,
    required this.doctor,
    this.doctorId = '',
  });
  Schedule.empty()
      : id = '',
        day = '',
        startTime = '',
        endTime = '',
        break_start = '',
        break_end = '',
        buffer = 0,
        is_active = false,
        appointment_interval = 0,
        doctor = Doctor.empty(),
        doctorId = '';

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'] ?? '',
      day: json['day'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      break_start: json['break_start'],
      break_end: json['break_end'],
      buffer: json['buffer'] ?? 0,
      is_active: json['is_active'] ?? false,
      appointment_interval: json['appointment_interval'] ?? 0,
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'break_start': break_start,
      'break_end': break_end,
      'buffer': buffer,
      'is_active': is_active,
      'appointment_interval': appointment_interval,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
    };
  }
}

class Charges {
  String id = '';
  int amount = 0;
  String appointment_type = '';
  Doctor doctor = Doctor.empty();
  String doctorId = '';

  Charges({
    this.id = '',
    this.amount = 0,
    this.appointment_type = '',
    required this.doctor,
    this.doctorId = '',
  });
  Charges.empty()
      : id = '',
        amount = 0,
        appointment_type = '',
        doctor = Doctor.empty(),
        doctorId = '';

  factory Charges.fromJson(Map<String, dynamic> json) {
    return Charges(
      id: json['id'] ?? '',
      amount: json['amount'] ?? 0,
      appointment_type: json['appointment_type'] ?? '',
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'appointment_type': appointment_type,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
    };
  }
}



class Review {
  String id = '';
  int rating = 0;
  String review = '';
  DateTime date = DateTime.now();
  Doctor doctor = Doctor.empty();
  String doctorId = '';
  Patient patient = Patient.empty();
  String patientId = '';

  Review({
    this.id = '',
    this.rating = 0,
    this.review = '',
    required this.date,
    required this.doctor,
    this.doctorId = '',
    required this.patient,
    this.patientId = '',
  });

  Review.empty()
      : id = '',
        rating = 0,
        review = '',
        date = DateTime.now(),
        doctor = Doctor.empty(),
        doctorId = '',
        patient = Patient.empty(),
        patientId = '';
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
      patient: Patient.fromJson(json['Patient']),
      patientId: json['patientId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'review': review,
      'date': date.toIso8601String(),
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
      'Patient': patient.toJson(),
      'patientId': patientId,
    };
  }
}

class Transactions {
  String id = '';
  int amount = 0;
  String appointment_id = '';
  String patient_id = '';
  String doctor_id = '';
  String type = 'RECEIVED';
  String status = 'PENDING';
  DateTime created_at;
  DateTime updated_at;
  AppointmentModel appointment;
  Patient patient;
  Doctor doctor;

  Transactions({
    this.id = '',
    this.amount = 0,
    this.appointment_id = '',
    this.patient_id = '',
    this.doctor_id = '',
    this.type = 'RECEIVED',
    this.status = 'PENDING',
    required this.created_at,
    required this.updated_at,
    required this.appointment,
    required this.patient,
    required this.doctor,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'] ?? '',
      amount: json['amount'] ?? 0,
      appointment_id: json['appointment_id'] ?? '',
      patient_id: json['patient_id'] ?? '',
      doctor_id: json['doctor_id'] ?? '',
      type: json['type'] ?? 'RECEIVED',
      status: json['status'] ?? 'PENDING',
      created_at: DateTime.parse(json['created_at'] ?? ''),
      updated_at: DateTime.parse(json['updated_at'] ?? ''),
      appointment: AppointmentModel.fromJson(json['Appointment']),
      patient: Patient.fromJson(json['Patient']),
      doctor: Doctor.fromJson(json['Doctor']),
    );
  }
  Transactions.empty()
      : id = '',
        amount = 0,
        appointment_id = '',
        patient_id = '',
        doctor_id = '',
        type = '',
        status = '',
        created_at = DateTime.now(),
        updated_at = DateTime.now(),
        appointment = AppointmentModel.empty(),
        patient = Patient.empty(),
        doctor = Doctor.empty();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'appointment_id': appointment_id,
      'patient_id': patient_id,
      'doctor_id': doctor_id,
      'type': type,
      'status': status,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
      'Appointment': appointment.toJson(),
      'Patient': patient.toJson(),
      'Doctor': doctor.toJson(),
    };
  }
}

class Medication {
  String id = '';
  String medication = '';
  String dosage = '';
  String instructions = '';
  Prescription prescription ;
  String prescriptionId = '';

  Medication({
    this.id = '',
    this.medication = '',
    this.dosage = '',
    this.instructions = '',
    required this.prescription,
    this.prescriptionId = '',
  });

  Medication.empty()
      : id = '',
        medication = '',
        dosage = '',
        instructions = '',
        prescription = Prescription.empty(),
        prescriptionId = '';

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] ?? '',
      medication: json['medication'] ?? '',
      dosage: json['dosage'] ?? '',
      instructions: json['instructions'] ?? '',
      prescription: Prescription.fromJson(json['Prescription']),
      prescriptionId: json['prescriptionId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medication': medication,
      'dosage': dosage,
      'instructions': instructions,
      'Prescription': prescription.toJson(),
      'prescriptionId': prescriptionId,
    };
  }
}

class Prescription {
  String id = '';
  late AppointmentModel appointment;
  String appointmentId = '';
  late List<Medication> medication;

  Prescription({
    this.id = '',
    required this.appointment,
    this.appointmentId = '',
    List<Medication>? medication,
  }) : this.medication = medication ?? [];

  Prescription.empty()
      : id = '',
        appointment = AppointmentModel.empty(),
        appointmentId = '',
        medication = [];

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['id'] ?? '',
      appointment: AppointmentModel.fromJson(json['Appointment']),
      appointmentId: json['appointmentId'] ?? '',
      medication: (json['Medication'] as List<dynamic>?)
          ?.map((e) => Medication.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Appointment': appointment.toJson(),
      'appointmentId': appointmentId,
      'Medication': medication.map((e) => e.toJson()).toList(),
    };
  }
}
