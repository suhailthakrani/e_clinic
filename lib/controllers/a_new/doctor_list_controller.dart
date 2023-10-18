import 'package:get/get.dart';

class DoctorsListController extends GetxController {
  final doctors = <Doctor>[
    Doctor(name: 'Dr. John Doe', specialization: 'Cardiologist'),
    Doctor(name: 'Dr. Jane Smith', specialization: 'Dermatologist'),
    // Add more doctors as needed
  ].obs;

  List<Doctor> get getDoctors => doctors;
}

class Doctor {
  final String name;
  final String specialization;

  Doctor({required this.name, required this.specialization});
}