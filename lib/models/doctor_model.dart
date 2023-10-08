import '../models/appointment_model.dart';
import '../models/general_models.dart';
import '../models/user_model.dart';

class Doctor {
  String id = '';
  String specialization = '';
  String hospital_clinic_name = '';
  String verification = 'PENDING';
  String about = '';
  Location location = Location.empty();
  UserModel user = UserModel.empty();
  List<String> appointment_types_allowed = ['PHYSICAL'];
  List<Document> degree = [];
  List<Schedule> schedule = [];
  List<Charges> charges = [];
  List<AppointmentModel> appointment = [];
  List<Review> reviews = [];
  List<Transactions> transactions = [];

  Doctor({
    this.id = '',
    this.specialization = '',
    this.hospital_clinic_name = '',
    this.verification = 'PENDING',
    required this.about,
    required this.location,
    required this.user,
    required this.appointment_types_allowed,
    required this.degree,
    required this.schedule,
    required this.charges ,
    required this.appointment,
    required this.reviews ,
    required this.transactions,
  });

  Doctor.empty()
      : id = '',
        specialization = '',
        hospital_clinic_name = '',
        verification = '',
        about = '',
        location = Location.empty(),
        user = UserModel.empty(),
        appointment_types_allowed = [],
        degree = [],
        schedule = [],
        charges = [],
        appointment = [],
        reviews = [],
        transactions = [];

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      specialization: json['specialization'] ?? '',
      hospital_clinic_name: json['hospital_clinic_name'] ?? '',
      verification: json['verification'] ?? 'PENDING',
      about: json['about'],
      location: Location.fromJson(json['location']),
      user: UserModel.fromJson(json['user']),
      appointment_types_allowed: (json['appointment_types_allowed'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          ['PHYSICAL'],
      degree: (json['degree'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e))
          .toList() ??
          [],
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e))
          .toList() ??
          [],
      charges: (json['charges'] as List<dynamic>?)
          ?.map((e) => Charges.fromJson(e))
          .toList() ??
          [],
      appointment: (json['appointment'] as List<dynamic>?)
          ?.map((e) => AppointmentModel.fromJson(e))
          .toList() ??
          [],
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e))
          .toList() ??
          [],
      transactions: (json['Transactions'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialization': specialization,
      'hospital_clinic_name': hospital_clinic_name,
      'verification': verification,
      'about': about,
      'location': location.toJson(),
      'user': user.toJson(),
      'appointment_types_allowed': appointment_types_allowed,
      'degree': degree.map((e) => e.toJson()).toList(),
      'schedule': schedule.map((e) => e.toJson()).toList(),
      'charges': charges.map((e) => e.toJson()).toList(),
      'appointment': appointment.map((e) => e.toJson()).toList(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'Transactions': transactions.map((e) => e.toJson()).toList(),
    };
  }
}