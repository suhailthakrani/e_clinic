import 'package:e_clinic/ui/labs/patient_labs/widgets/test_card.dart';
import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/labs/lab_list_screen_controller.dart';
import '../../../controllers/labs/test_list_screen_controller.dart';
import '../../../controllers/prescription_screen_controller.dart';
import '../../../utils/colors.dart';
import '../../screens/prescriptions/widgets/prescription_card.dart';

class TestListViewScreen extends GetView<TestListScreenController> {
  const TestListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Test List Screen',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: 20.h),
                if (controller.testList.isEmpty)
                  Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                else
                  for (int i = 0; i < controller.testList.length; i++)
                    TestCard(
                      labTest: controller.testList[i],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
