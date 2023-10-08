import '../models/appointment_model.dart';
import '../models/general_models.dart';
import '../models/user_model.dart';

class Patient {
  String id = '';
  DateTime birthdate = DateTime.now();
  UserModel user = UserModel.empty();
  String userId = '';
  List<AppointmentModel> appointment = [];
  List<Review> reviews = [];
  List<Transactions> transactions = [];

  Patient({
    this.id = '',
    required this.birthdate,
    required this.user,
    this.userId = '',
    List<AppointmentModel>? appointment,
    List<Review>? reviews,
    List<Transactions>? transactions,
  })  : appointment = appointment ?? [],
        reviews = reviews ?? [],
        transactions = transactions ?? [];

        Patient.empty()
      : id = '',
        birthdate = DateTime.now(),
        user = UserModel.empty(),
        userId = '',
        appointment = [],
        reviews = [],
        transactions = [];

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? '',
      birthdate: DateTime.parse(json['birthdate'] ?? ''),
      user: UserModel.fromJson(json['user']),
      userId: json['userId'] ?? '',
      appointment: (json['Appointment'] as List<dynamic>?)
          ?.map((e) => AppointmentModel.fromJson(e))
          .toList() ??
          [],
      reviews: (json['Reviews'] as List<dynamic>?)
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
      'birthdate': birthdate.toIso8601String(),
      'user': user.toJson(),
      'userId': userId,
      'Appointment': appointment.map((e) => e.toJson()).toList(),
      'Reviews': reviews.map((e) => e.toJson()).toList(),
      'Transactions': transactions.map((e) => e.toJson()).toList(),
    };
  }
}