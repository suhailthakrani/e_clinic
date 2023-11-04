import 'package:e_clinic/controllers/appointments/appointments_screen_cntroller.dart';
import 'package:e_clinic/models/new_appointment_model.dart';
import 'package:e_clinic/utils/app_enum.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentCardNew extends StatelessWidget {
  final AppointmentModelNew appointment;
  // final AppointmentScreenController controller;

  const AppointmentCardNew(this.appointment,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h,left: 8,right: 8),
      padding: EdgeInsets.only(top: 10.h, bottom: 4.h, right: 16.w, left: 16.w),
      // height: 220.h,
      width: Get.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(249, 246, 244, 1),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:appointment.image != null && appointment.image.isNotEmpty? Image.network(
                    appointment.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container();
                    },
                  ):Container(),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. ${appointment.doctor.firstName} ${appointment.doctor.lastName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${appointment.doctor.specialization}',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Container(
                decoration: BoxDecoration(
                      border: Border.all(color: kFieldBorderColor)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      convertDateFormat(appointment.date.toString()),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      
                      child: Text(
                        convertToAMPM(appointment.time),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                             ),
               ),
              if (appointment.completed)
                Chip(
                  avatar: const Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: kGreenNormalColor,
                  ),
                  label: Text(
                    AppointmentStatus.completed.name
                            .toString()
                            .capitalizeFirst ??
                        '',
                    style: const TextStyle(
                      color: kGreenNormalColor,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: kFieldBorderColor,
                )
              // else if (appointment)
              //   const Chip(
              //     avatar: Icon(
              //       CupertinoIcons.multiply_circle,
              //       color: kWhiteColor,
              //     ),
              //     label: Text(
              //       "Cancelled",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 12,
              //       ),
              //     ),
              //     backgroundColor: Colors.redAccent,
              //   )
              else
                Chip(
                  avatar: const Icon(
                    CupertinoIcons.time,
                    color: kYellowColor,
                  ),
                  label: Text(
                    AppointmentStatus.pending.name.capitalizeFirst.toString(),
                    style: const TextStyle(
                      color: kYellowColor,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: kFieldBorderColor,
                ),
             
            ],
          ),
          Row(
            children: [
              const Text("Patient Name: "),
              Text(
                appointment.patientName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                  label: Text(
                    appointment.type.capitalizeFirst.toString(),
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: kGreenColor.withAlpha(50)),
              Chip(
                  label: Text(
                    'RS. ${appointment.charges.toString()}',
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: kGreenColor.withAlpha(50)),
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
