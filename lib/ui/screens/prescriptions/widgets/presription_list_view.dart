import 'package:e_clinic/ui/screens/prescriptions/widgets/prescription_card.dart';
import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/prescription_screen_controller.dart';
import '../../../../utils/colors.dart';

class PrescriptionsListView extends GetView<PrescriptionScreenController> {
  const PrescriptionsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PrescriptionScreenController());
    return Scaffold(
     appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Prescriptions',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: 20.h),
                if (controller.prescriptionList.isEmpty)
                  Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                else
                  for (int i = 0; i < controller.prescriptionList.length; i++)
                    PrescriptionCard(
                      prescription: controller.prescriptionList[i],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
