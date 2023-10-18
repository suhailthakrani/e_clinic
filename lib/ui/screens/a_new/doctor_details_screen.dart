import 'package:e_clinic/controllers/a_new/doctor_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsScreen extends GetView<DoctorsListController> {
  final int doctorIndex;

  const DoctorDetailsScreen({super.key, required this.doctorIndex});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: ${controller.getDoctors[doctorIndex].name}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Specialization: ${controller.getDoctors[doctorIndex].specialization}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
