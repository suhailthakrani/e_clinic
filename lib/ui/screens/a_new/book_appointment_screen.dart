import 'package:e_clinic/controllers/a_new/doctor_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentView extends GetView<DoctorsListController> {
  final int doctorIndex;

  BookAppointmentView({required this.doctorIndex});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Doctor: ${controller.getDoctors[doctorIndex].name}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Add appointment booking UI here
          ],
        ),
      ),
    );
  }
}
