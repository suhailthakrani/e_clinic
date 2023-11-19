import 'package:e_clinic/models/base_model.dart';

class UserModel  extends BaseModel{
  String id = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String gender = '';
  String role = '';
  String image = '';
  bool profileSetup = false;
  String birthdate = '';
  String password = '';

  UserModel.empty();

  UserModel({
    this.id = '',
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.role,
    required this.image,
    required this.profileSetup,
    required this.birthdate,
    this.password = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      role: json['role'] ?? '',
      image: json['image'] ?? '',
      profileSetup: json['profile_setup'] ?? false,
      birthdate: json['birthdate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      // 'phone': phone,
      'gender': gender,
      // 'role': role,
      // 'image': image,
      // 'profile_setup': profileSetup,
      'birthdate': birthdate,
      'password': password,
    };
  }
}
