class AvailabilityModel {
  String day = '';
  String startTime = '';
  String endTime = '';
  bool isActive = false;
  int appointmentInterval = 0;
  int buffer = 0;

  AvailabilityModel({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isActive,
    required this.appointmentInterval,
    required this.buffer,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      isActive: json['is_active'],
      appointmentInterval: json['appointment_interval'],
      buffer: json['buffer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'is_active': isActive,
      'appointment_interval': appointmentInterval,
      'buffer': buffer,
    };
  }

  AvailabilityModel copyWith({
    String? day,
    String? startTime,
    String? endTime,
    bool? isActive,
    int? appointmentInterval,
    int? buffer,
  }) {
    return AvailabilityModel(
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isActive: isActive ?? this.isActive,
      appointmentInterval: appointmentInterval ?? this.appointmentInterval,
      buffer: buffer ?? this.buffer,
    );
  }
}
