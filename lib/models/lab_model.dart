import 'package:e_clinic/models/base_model.dart';

class LabModel extends BaseModel{
  String id = "";
  String email = '';
  String name = "";
  String address = "";
  String city = "";
  String state = "";
  String password = '';

  LabModel({
    this.id = '',
    required this.email,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.password,
  });

  LabModel.empty();



  factory LabModel.fromJson(Map<String, dynamic> json) {
  return LabModel(
    id: json['id'] ?? "",
    name: json['name'] ?? "",
    address: json['address'] ?? "",
    city: json['city'] ?? "",
    state: json['state'] ?? "",
    email: json['email'] ?? "",
    password: json['password']??'',
  );
}

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'email': email,
      'password': password,
    };
  }
}
