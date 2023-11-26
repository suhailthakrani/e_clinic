import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/models/new_lab_model.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TestCard extends StatelessWidget {
  final NewLabModel labTest;

  const TestCard({Key? key, required this.labTest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${labTest.name}",
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
                      "${labTest.description}",
                      style:  TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                     const SizedBox(height: 5),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Lab Details",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labTest.lab.name,
              style: const TextStyle(color: kGreyColor, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${labTest.lab.address}, ${labTest.lab.city}, ${labTest.lab.state}",
              style: const TextStyle(color: kGreyColor, fontSize: 12),
            ),
          ),
       
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${convertDateFormat(labTest.createdAt.toString())}",
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
