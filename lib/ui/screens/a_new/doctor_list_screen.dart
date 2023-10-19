import 'package:e_clinic/controllers/a_new/doctor_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsListView extends GetView<DoctorsListController> {
  const DoctorsListView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      // body: ListView.builder(
      //   itemCount: controller.getDoctors.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(controller.getDoctors[index].name),
      //       subtitle: Text(controller.getDoctors[index].specialization),
      //       onTap: () {
      //         Get.toNamed('/doctor_details', arguments: {'index': index});
      //       },
      //     );
      //   },
      // ),
    );
  }
}
