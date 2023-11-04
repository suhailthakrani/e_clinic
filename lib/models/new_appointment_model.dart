class NewDoctor {
  String userId;
  String firstName;
  String lastName;
  String specialization;

  NewDoctor({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.specialization,
  });

  factory NewDoctor.fromJson(Map<String, dynamic> json) {
    return NewDoctor(
      userId: json['userId']??'',
      firstName: json['first_name']??'',
      lastName: json['last_name']??'',
      specialization: json['specialization']??'',
    );
  }
}

class AppointmentModelNew {
  String id;
  String patientName;
  DateTime date;
  String time;
  String type;
  double charges;
  String message;
  bool completed;
  NewDoctor doctor;
  String image;

  AppointmentModelNew({
    required this.id,
    required this.patientName,
    required this.date,
    required this.time,
    required this.type,
    required this.charges,
    required this.message,
    required this.completed,
    required this.doctor,
    required this.image,
  });

  factory AppointmentModelNew.fromJson(Map<String, dynamic> json) {
    return AppointmentModelNew(
      id: json['id'] ??'',
      patientName: json['patient_name'] ??'',
      date: DateTime.parse(json['date']??''),
      time: json['time'] ??'',
      type: json['type'] ??'',
      charges: (json['charges']??'0.0').toDouble(),
      message: json['message']??"",
      completed: json['completed']??false,
      doctor: NewDoctor.fromJson(json['doctor']??{}),
      image: json['image']??'',
    );
  }
}
