class AppointmentTypeModel {
  final String title;
  final bool selected;

  AppointmentTypeModel({
    required this.title,
    required this.selected,
  });

  factory AppointmentTypeModel.fromJson(Map<String, dynamic> json) {
    return AppointmentTypeModel(
      title: json['title'],
      selected: json['selected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'selected': selected,
    };
  }

  AppointmentTypeModel copyWith({
    String? title,
    bool? selected,
  }) {
    return AppointmentTypeModel(
      title: title ?? this.title,
      selected: selected ?? this.selected,
    );
  }
}
