import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/models/lab_model.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LabCard extends StatelessWidget {
  final LabModel labTest;
  VoidCallback? onTap;
  bool show = false;
  LabCard({Key? key, required this.labTest, this.onTap, this.show = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      width: Get.width,
      height: 150.h,
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/lab_management.png",
                height: 70,
                width: 70,
                color: kPrimaryColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${labTest.name}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "${labTest.address}, ${labTest.city}, ${labTest.state}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            height: 30.h,
            // width: 100.w,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(kBookLabAppointmentScreenRoute,
                    arguments: {'labId': labTest.id});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(87, 98, 182, 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Book Test",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
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
