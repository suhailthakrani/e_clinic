import 'package:flutter/cupertino.dart';

import '../../../controllers/labs/lab_dashboard_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';


class LabDashboardScreen extends GetView<LabDashboardScreenController> {
  const LabDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Lab Management',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ScreenUtilInit(
              designSize: const Size(428, 926),
              builder: (context, widget) => const Column(
              children: [

              ],),
            ),
          ),
        );
      }),
    );
  }


}
