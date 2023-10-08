import 'dart:convert';

import '../models/base_model.dart';
import '../models/doctor_model.dart';
import '../models/patient_model.dart';

import 'general_models.dart';

class UserModel extends BaseModel {
  String firstName = '';
  String lastName = '';
  String cnic = '';
  String email = '';
  String gender = '';
  String specialization = '';
  String degreeDocument = '';
  String hospitalClinicName = '';
  String address = '';
  String city = '';
  String state = '';
  String password = '';
  String experience = '';

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.cnic,
    required this.email,
    required this.gender,
    required this.specialization,
    required this.degreeDocument,
    required this.hospitalClinicName,
    required this.address,
    required this.city,
    required this.state,
    required this.password,
    required this.experience,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
        cnic: json['cnic'] ?? '',
        email: json['email'] ?? '',
        gender: json['gender'] ?? '',
        specialization: json['specialization'] ?? '',
        degreeDocument: json['degree_document'] ?? '',
        hospitalClinicName: json['hospital_clinic_name'] ?? '',
        address: json['address'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        password: json['password'] ?? '',
        experience: json['experiene'] ?? '');
  }

  UserModel.empty()
      : firstName = '',
        lastName = '',
        email = '',
        cnic = '',
        gender = '',
        specialization = '',
        degreeDocument = '',
        hospitalClinicName = '',
        address = '',
        city = '',
        state = '',
        password = '';

  Map<String, String> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      // 'cnic':cnic,
      'email': email,
      'gender': gender,
      'specialization': specialization,
      'hospital_clinic_name': hospitalClinicName,
      'address': address,
      'city': city,
      'state': state,
      'password': password,
      // 'degree_document': degreeDocument,
    };
  }

  @override
  String toString() {
    return 'UserModel{'
        'firstName: $firstName, '
        'lastName: $lastName, '
        'email: $email, '
        'gender: $gender, '
        'specialization: $specialization, '
        'hospitalClinicName: $hospitalClinicName, '
        'address: $address, '
        'city: $city, '
        'state: $state}';
  }
}

class UserModel2 extends BaseModel {
  String id = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String gender = '';
  String image = '';
  bool emailVerified = false;
  bool phoneVerified = false;
  bool profileSetup = false;
  String role = '';
  String password = '';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  Patient patient = Patient.empty();
  Doctor doctor = Doctor.empty();

  UserModel2({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    required this.phone,
    this.gender = '',
    required this.image,
    this.emailVerified = false,
    this.phoneVerified = false,
    this.profileSetup = false,
    this.role = 'PATIENT',
    this.password = '',
    required this.createdAt,
    required this.updatedAt,
    required this.patient,
    required this.doctor,
  });
  UserModel2.empty()
      : id = '',
        firstName = '',
        lastName = '',
        email = '',
        phone = '',
        gender = '',
        image = '',
        emailVerified = false,
        phoneVerified = false,
        profileSetup = false,
        role = 'PATIENT',
        password = '',
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        patient = Patient.empty(),
        doctor = Doctor.empty();

  factory UserModel2.fromJson(Map<String, dynamic> json) {
    return UserModel2(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      gender: json['gender'] ?? '',
      image: json['image'],
      emailVerified: json['email_verified'] ?? false,
      phoneVerified: json['phone_verified'] ?? false,
      profileSetup: json['profile_setup'] ?? false,
      role: json['role'] ?? 'PATIENT',
      password: json['password'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      patient: json['patient'] != null
          ? Patient.fromJson(json['patient'])
          : Patient.empty(),
      doctor: json['doctor'] != null
          ? Doctor.fromJson(json['doctor'])
          : Doctor.empty(),
    );
  }

  Map<String, String> toJson() {
    return {
      // 'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      // 'phone': phone,
      'gender': gender,
      'image': image,
      // 'email_verified': emailVerified,
      // 'phone_verified': phoneVerified,
      // 'profile_setup': profileSetup,
      'role': role,
      'password': password,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
      // 'patient': patient.toJson(),
      // 'doctor': doctor.toJson(),
    };
  }

  Map<String, String> saveInJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'image': image,
      'email_verified': emailVerified.toString(),
      'phone_verified': phoneVerified.toString(),
      'profile_setup': profileSetup.toString(),
      'role': role,
      'password': password,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'patient': jsonEncode(patient.toJson()),
      'doctor': jsonEncode(doctor.toJson()),
    };
  }
}
