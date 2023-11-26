class NewLabModel {
  String id;
  String name;
  String description;
  String labId;
  String patientId;
  DateTime createdAt;
  Lab lab;

  NewLabModel({
    required this.id,
    required this.name,
    required this.description,
    required this.labId,
    required this.patientId,
    required this.createdAt,
    required this.lab,
  });

  // Factory constructor to create NewLabModel from JSON
  factory NewLabModel.fromJson(Map<String, dynamic> json) {
    return NewLabModel(
      id: json['id']??'',
      name: json['name']??'',
      description: json['description']??'',
      labId: json['labId']??'',
      patientId: json['patientId']??'',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']):DateTime.now(),
      lab: Lab.fromJson(json['Lab']??{}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'labId': labId,
      'patientId': patientId,
      'created_at': createdAt.toIso8601String(),
      'lab': lab.toJson(),
    };
  }

}

class Lab {
  String name;
  String address;
  String city;
  String state;

  Lab({
    required this.name,
    required this.address,
    required this.city,
    required this.state,
  });

  // Factory constructor to create Lab from JSON
  factory Lab.fromJson(Map<String, dynamic> json) {
    return Lab(
      name: json['name']??'',
      address: json['address']??'',
      city: json['city']??'',
      state: json['state']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'state': state,
    };
  }
}