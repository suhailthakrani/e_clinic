import 'dart:math';

import 'package:e_clinic/controllers/new/doctor_list_screen_controller.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'doctor_search_deligate.dart';

class DoctorsListScreen extends GetView<DoctorListScreenController> {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          title: Text(
            'Doctor Details',
            style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: DoctorSearchDelegate(controller.doctors,
                      controller.searchController.controller.text),
                );
              },
              child: Icon(Icons.search),
            ),
            SizedBox(width: 30),
          ],
        ),
        body: Obx(() => controller.doctors.isNotEmpty
            ? ListView.builder(
                itemCount: controller.doctors.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(kDoctorsDetailsScreenRoute, arguments: {
                        "dotor": controller.doctors[index],
                      });
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      elevation: 8,
                      child: Container(
                        // width: Get.width * 0.6,
                        height: Get.height * 0.24,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              height: double.maxFinite,
                              width: Get.width * 0.28,
                              decoration: BoxDecoration(
                                // color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  controller.doctors[index].image,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, child, loadingProgress) =>
                                          Container(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              // width: double.maxFinite,
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 12, vertical: 8),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Dr. ${controller.doctors[index].firstName} ${controller.doctors[index].lastName}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      controller.doctors[index].specialization,
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Experience: ",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          " ${Random().nextInt(10) + 1}+ Years",
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: double.tryParse(controller
                                                  .doctors[index].rating) ??
                                              3.8,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15.0,
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                          "  (${controller.doctors[index].reviewsCount}+)",
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        // const Icon(
                                        //   CupertinoIcons.time,
                                        //   size: 16,
                                        // ),
                                        // const SizedBox(width: 4),
                                        Text(
                                          "Timing: ${controller.doctors[index].workingHours.startTime} to ${controller.doctors[index].workingHours.endTime}",
                                          style: const TextStyle(
                                            color: kBlack90Color,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Icon(
                                        //   Icons.location_on,
                                        //   color: kPrimaryColor,
                                        //   size: 18,
                                        // ),
                                        // SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            "Address: ${controller.doctors[index].address} ${controller.doctors[index].city}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: kBlack90Color,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Chip(
                                      label: Text("Book Appointment"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: Get.height * 0.3,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )));
  }
}
