import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';


class PrescriptionDetail extends StatelessWidget {
  final Prescription prescription;
  PrescriptionDetail({Key? key, required this.prescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Prescription Detail'),
        actions: const [
          // ProfileAvatar(),
        ],
        elevation: 0,
      ),
      body: Container(
        // height: 420.h,
        // width: 315.w,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12.w,
              spreadRadius: 5.w,
              offset: Offset(0, 12.w),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Patient Information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Doctor Name"),
                Text(prescription.appointment.patientName),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Appointment Type"),
                Text(prescription.appointment.type),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Time"),
                Text(convertToAMPM(prescription.appointment.time))
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Date"),
                Text(convertDateFormat(
                    prescription.appointment.date.toIso8601String())),
              ],
            ),
            const Divider(
              thickness: 5,
            ),
            SizedBox(height: 12.h),
            const Text(
              "Medicine Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            for (int i = 0; i < prescription.medication.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                            "${prescription.medication[i].medication} - ${prescription.medication[i].dosage}")),
                    Expanded(
                        flex: 1,
                        child: Text(prescription.medication[i].instructions))
                  ],
                ),
              ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            //     SizedBox(width: 12.w),
            //     IconButton(onPressed: ()  {
            //     }, icon: const Icon(Icons.download)),
            //   ],
            // ),
          ],
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
