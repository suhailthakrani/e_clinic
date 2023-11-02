class MeModel {
  String id = "";
  String firstName = "";
  String lastName = "";
  String? email = "";
  String? phone = "";
  String gender = "";
  String role = "";
  String? image = "";
  String profileSetup = 'false';
  String birthdate = "";

  MeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email = '',
    this.phone = '',
    required this.gender,
    required this.role,
    this.image = '',
    required this.profileSetup,
    required this.birthdate,
  });

  factory MeModel.fromJson(Map<String, dynamic> json) {
    return MeModel(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      role: json['role'] ?? '',
      image: json['image'] ?? '',
      profileSetup: json['profile_setup'].toString(),
      birthdate: json['birthdate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'role': role,
      'image': image,
      'profile_setup': profileSetup,
      'birthdate': birthdate,
    };
  }
}
