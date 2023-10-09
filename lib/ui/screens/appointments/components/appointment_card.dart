import '../../../../utils/app_enum.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    required this.drName,
    required this.category,
    required this.image,
    required this.status,
  }) : super(key: key);

  final String drName;
  final String category;
  final String image;
  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => Container(
        margin: EdgeInsets.only(bottom: 25.h),
        padding:
            EdgeInsets.only(top: 10.h, bottom: 4.h, right: 16.w, left: 16.w),
        height: 145.h,
        width: 330.w,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(image),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        category,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                if (status == AppointmentStatus.completed)
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
                else if (status == AppointmentStatus.cancelled)
                  const Chip(
                    avatar: Icon(
                      CupertinoIcons.multiply_circle,
                      color: kWhiteColor,
                    ),
                    label: Text(
                      "Cancelled",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: Colors.redAccent,
                  )
                else if (status == AppointmentStatus.pending)
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "31 September 2020",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: (status == AppointmentStatus.pending),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // TODO: Reject Appointment
                      },
                      child: const Chip(
                        avatar: Icon(
                          CupertinoIcons.multiply_circle,
                          color: kWhiteColor,
                        ),
                        label: Text(
                          "Cancel",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kRequiredRedColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        // TODO: Accept Appointment
                      },
                      child: const Chip(
                        avatar: Icon(
                          Icons.check_circle_outline,
                          color: kWhiteColor,
                        ),
                        label: Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kGreenNormalColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: (status == AppointmentStatus.completed),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kPrescriptionScreenRoute);
                      },
                      child: Chip(
                        label: const Text(
                          "Prescribe",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        // TODO: Accept Appointment
                      },
                      child: Chip(
                        label: const Text(
                          "Write Report",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kBlueColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
