import '../models/appointment_model.dart';
import '../models/general_models.dart';
import '../models/user_model.dart';

class Doctor {
  String id = "";
  String specialization = "";
  String hospitalClinicName = "";
  String verification = "";
  String? about = "";
  String locationId = "";
  String userId = "";
  List<String> appointmentTypesAllowed = [];
  String firstName = "";
  String lastName = "";
  String image = "";
  String address = "";
  String city = "";
  String state = "";
  WorkingHours workingHours = WorkingHours.empty();
  Charges charges = Charges.empty();
  String reviewsCount = "";
  String rating = "";

  Doctor.empty();

  Doctor({
    required this.id,
    required this.specialization,
    required this.hospitalClinicName,
    required this.verification,
    required this.about,
    required this.locationId,
    required this.userId,
    required this.appointmentTypesAllowed,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.address,
    required this.city,
    required this.state,
    required this.workingHours,
    required this.charges,
    required this.reviewsCount,
    required this.rating,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
  return Doctor(
    id: json['id'] ?? "",
    specialization: json['specialization'] ?? "",
    hospitalClinicName: json['hospital_clinic_name'] ?? "",
    verification: json['verification'] ?? "",
    about: json['about'] ?? "",
    locationId: json['locationId'] ?? "",
    userId: json['userId'] ?? "",
    appointmentTypesAllowed: List<String>.from(json['appointment_types_allowed'] ?? []),
    firstName: json['first_name'] ?? "",
    lastName: json['last_name'] ?? "",
    image: json['image'] ?? "",
    address: json['address'] ?? "",
    city: json['city'] ?? "",
    state: json['state'] ?? "",
    workingHours: WorkingHours.fromJson(json['workingHours'] ??{}),
    charges: Charges.fromJson(json['charges'] ?? {}),
    reviewsCount: '${json['reviewsCount'] ?? ""}',
    rating: '${json['rating'] ?? ""}',
  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialization': specialization,
      'hospital_clinic_name': hospitalClinicName,
      'verification': verification,
      'about': about,
      'locationId': locationId,
      'userId': userId,
      'appointment_types_allowed': appointmentTypesAllowed,
      'first_name': firstName,
      'last_name': lastName,
      'image': image,
      'address': address,
      'city': city,
      'state': state,
      'workingHours': workingHours,
      'charges': charges,
      'reviewsCount': reviewsCount,
      'rating': rating,
    };
  }
}
class WorkingHours {
  String startTime = '';
  String endTime = '';

  WorkingHours({
    required this.startTime,
    required this.endTime,
  });
  WorkingHours.empty();

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      startTime: json['startTime']??'',
      endTime: json['endTime']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}

class Charges {
  String physical ='';
  String virtual = '';

  Charges({
    required this.physical,
    required this.virtual,
  });
  Charges.empty();

  factory Charges.fromJson(Map<String, dynamic> json) {
    return Charges(
      physical: "${json['physical'] ?? ''}",
      virtual: "${json['virtual'] ?? ''}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'physical': physical,
      'virtual': virtual,
    };
  }
}
