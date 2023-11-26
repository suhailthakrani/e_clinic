import 'package:e_clinic/controllers/labs/lab_side_list_screen_controller.dart';
import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:e_clinic/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';

class LabSideTestScreen extends GetView<LabSideTestListScreenController> {
  const LabSideTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      boolShowDrawer: false,
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Test Requests',
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      padding: EdgeInsets.all(16.w),
                      width: Get.width,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10.w,
                            spreadRadius: 5.w,
                            offset: Offset(0.w, 5.w),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${controller.testList[i].name}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "${controller.testList[i].description}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${convertDateFormat(controller.testList[i].createdAt.toString())}",
                                      style: const TextStyle(
                                        color: kGreyColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Image.asset(
                                      "assets/images/mlab.png",
                                      height: 70,
                                      width: 70,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    await controller.pickImage(i);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller
                                            .testUploadReportUrlList[i]
                                            .isNotEmpty
                                        ? kGreenNormalColor
                                        : kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    controller.testUploadReportUrlList[i]
                                            .isNotEmpty
                                        ? "Report Picked"
                                        : "Upload Report",
                                    style: const TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: controller
                                          .testUploadReportUrlList[i].isNotEmpty
                                      ? () async {
                                          await controller.uploadReport(
                                              controller.testList[i].id, i);
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller
                                            .testUploadReportUrlList[i]
                                            .isNotEmpty
                                        ? kPrimaryColor
                                        : kGreyColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Submit Report",
                                    style: TextStyle(
                                      color: controller
                                              .testUploadReportUrlList[i]
                                              .isNotEmpty
                                          ? kWhiteColor
                                          : kTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kWhiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () async {
                      bool value = await UserSession().logout();
                      if (value) {
                        Get.offAllNamed(kTestScreenRoute);
                      }
                    },
                    child: Icon(
                      Icons.logout_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String convertDateFormat(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('d MMMM y').format(dateTime);
  return formattedDate;
}

String convertToAMPM(String timeString) {
  DateTime dateTime = DateFormat('HH:mm').parse(timeString);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}
