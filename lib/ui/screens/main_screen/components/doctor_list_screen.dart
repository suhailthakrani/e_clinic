import 'dart:ffi';
import 'dart:math';

import 'package:e_clinic/models/doctor_model.dart';
import 'package:e_clinic/services/doctors_service.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorsListScreen extends StatefulWidget {
  List<Doctor> doctors = [];
  String category = "";
  DoctorsListScreen({super.key, required this.doctors, required this.category});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}



class _DoctorsListScreenState extends State<DoctorsListScreen> {
  Future<void> onInit() async {
    doctors.value = await DoctorsService().getDoctorsListByCategory(widget.category)
  }
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
        ),
        body:  widget.doctors.isNotEmpty
              ? ListView.builder(
                  itemCount: widget.doctors.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const DoctorDetailsScreen(),
                        //   ),
                        // );
                        // onDrIndexChanged(index);
                        Get.toNamed(kDoctorsDetailsScreenRoute);
                      },
                      child: Card(
                        child: Container(
                          // width: Get.width * 0.6,
                          height: Get.height * 0.24,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: Get.width * 0.24,
                                width: Get.width * 0.24,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    widget.doctors[index].image,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, child, loadingProgress) =>
                                            const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                // width: double.maxFinite,
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 12, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Dr. ${widget.doctors[index].firstName} ${widget.doctors[index].lastName}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.doctors[index]
                                              .specialization,
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "  Experience: ",
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
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: double.parse(widget.doctors[index].rating),
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
                                          "  (${widget.doctors[index].reviewsCount}+)",
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
                                          "Timing: ${widget.doctors[index].workingHours.startTime} to ${widget.doctors[index].workingHours.endTime}",
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
                                            "Address: ${widget.doctors[index].address} ${widget.doctors[index].city}",
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
                                    )
                                  ],
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
                ),
        );
  }
}
