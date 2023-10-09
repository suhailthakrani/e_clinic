import '../../../controllers/prescription_screen_controller.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/prescriptions_list.dart';

class PrescriptionsScreen extends GetView<PrescriptionScreenController> {
  const PrescriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text('Prescription'),
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
      ),
      body: SingleChildScrollView(
        child: ScreenUtilInit(
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          builder: (context, w) => Center(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                ...prescriptions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
