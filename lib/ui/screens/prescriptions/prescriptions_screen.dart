import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/prescription_screen_controller.dart';
import '../../../utils/colors.dart';
import 'widgets/prescription_card.dart';

class PrescriptionsScreen extends GetView<PrescriptionScreenController> {
  const PrescriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'prescrion model',
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
