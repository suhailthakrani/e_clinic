import 'dart:convert';
import 'dart:math';

import 'package:e_clinic/models/doctor_model.dart';
import 'package:e_clinic/services/service_urls.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../controllers/new/main_screen_controller.dart';
import '../../widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_search_field.dart';
import 'components/doctor_list_screen.dart';
import 'components/doctor_search_deligate.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Dashboard',
      // appBar: AppBar(),
      // endDrawer: const CustomDrawer(),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          leadingWidth: 0,
          toolbarHeight: 65,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: CustomSearchField(
              controller: controller.searchController.controller,
              height: 50,
              hint: 'Search for Doctors',
              focusNode: FocusNode(),
              onTap: () {
                showSearch(
                  context: context,
                  delegate: DoctorSearchDelegate(controller.doctorsList, controller.searchController.controller.text),
                );
              },
            ),
          ),
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(50),
          //   child: DefaultTabController(
          //     length: 4,
          //     child: TabBar(
          //       isScrollable: true,
          //       indicatorSize: TabBarIndicatorSize.tab,
          //       indicatorColor: kPrimaryColor,
          //       labelColor: Colors.black,
          //       unselectedLabelColor: Colors.black54,
          //       labelStyle: TextStyle(
          //         fontSize: 15.sp,
          //         fontWeight: FontWeight.w700,
          //       ),
          //       tabs: const [
          //         Tab(
          //           text: 'Psychologist',
          //         ),
          //         Tab(
          //           text: 'Cardiologist',
          //         ),
          //         Tab(
          //           text: 'Gastriologist',
          //         ),
          //         Tab(
          //           text: 'Dermatologist',
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              // SizedBox(height: 20.h),
              SizedBox(
                height: 150.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        child: Card(
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadowColor: kGreenColor,
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: kWhiteColor,
                                  radius: 24,
                                  child: Icon(
                                    Icons.add,
                                    color: kPrimaryColor,
                                    size: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Text(
                                  'Cnic Visit',
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Text(
                                  'Make an Appointment',
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Material(
                        child: Card(
                          color: kWhiteColor,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(24),

                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadowColor: kGreyColor,
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      kPrimaryColor.withOpacity(0.15),
                                  radius: 24,
                                  child: Icon(
                                    Icons.home,
                                    color: kPrimaryColor,
                                    size: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Home Visit',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Call the doctor home',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: kBlack90Color,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: Get.height * 0.2,
                child: Obx(
                  () => controller.categoriesList.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.categoriesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: Get.width * 0.4,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    kDoctorsListScreenRoute,
                                    arguments: {
                                      "category":
                                          controller.categoriesList[index],
                                    },
                                  );
                                },
                                child: buildCard(
                                  title: controller.categoriesList[index],
                                  desc:
                                      "${Random().nextInt(10) + 1} Specialists",
                                  // '${controller.doctorsCategories[index].noOfDr} Specialists',
                                  // imgUrl: controller.doctorsCategories[index].image,
                                  imgUrl:
                                      controller.categoriesImagesList[index] ??
                                          "assets/images/dermatology.png",
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(right: 16),
                            height: Get.height * 0.2,
                            width: Get.width * 0.4,
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
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text(
                    'Popular Doctors',
                    style: TextStyle(
                      color: kBlack90Color,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                  height: Get.height * 0.35,
                  child: Obx(
                    () => controller.doctorsList.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.doctorsList.length,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const DoctorDetailsScreen(),
                                  //   ),
                                  // );
                                  // controller.onDrIndexChanged(index);
                                  Get.toNamed(kDoctorsDetailsScreenRoute,
                                      arguments: {
                                        "dotor": controller.doctorsList[index],
                                      });
                                },
                                child: Container(
                                  width: Get.width * 0.6,
                                  height: Get.height * 0.35,
                                  padding: const EdgeInsets.all(8),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 0,
                                        right: 14,
                                        left: 14,
                                        child: Container(
                                          height: Get.width * 0.35,
                                          width: Get.height * 0.24,
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.asset(
                                              index%2 == 0?
                                              'assets/images/doctor.png':'assets/images/doctor2.png',
                                              // controller
                                              //     .doctorsList[index].image,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, child,
                                                      loadingProgress) =>
                                                  const Center(
                                                child:
                                                    Text("Loading...", style: TextStyle(color: kGreyColor),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Positioned(
                                        top: Get.width * 0.33,
                                        // bottom: 100,
                                        right: 0,
                                        left: 0,
                                        bottom: 0,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Container(
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Dr. ${controller.doctorsList[index].firstName} ${controller.doctorsList[index].lastName}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  controller.doctorsList[index]
                                                      .specialization,
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    RatingBarIndicator(
                                                      rating: double.tryParse(
                                                              (controller
                                                                  .doctorsList[
                                                                      index]
                                                                  .rating)) ??
                                                          3.0,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      itemCount: 5,
                                                      itemSize: 15.0,
                                                      direction:
                                                          Axis.horizontal,
                                                    ),
                                                    Text(
                                                      "  (${controller.doctorsList[index].reviewsCount}+)",
                                                      style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      "Experience: ",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      " ${Random().nextInt(10) + 1}+ Years",
                                                      style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                      "Timing: ${controller.doctorsList[index].workingHours.startTime} to ${controller.doctorsList[index].workingHours.endTime}",
                                                      style: const TextStyle(
                                                        color: kBlack90Color,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Icon(
                                                    //   Icons.location_on,
                                                    //   color: kPrimaryColor,
                                                    //   size: 18,
                                                    // ),
                                                    // SizedBox(width: 4),
                                                    Expanded(
                                                      child: Text(
                                                        "Address: ${controller.doctorsList[index].address} ${controller.doctorsList[index].city}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          color: kBlack90Color,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: kPrimaryColor,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20)
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: 7,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(right: 16),
                              height: Get.height * 0.2,
                              width: Get.width * 0.5,
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
                  ),
                  ),
                  

              // Column(
              //   children: [
              //     ...slidersItems,
              //   ],
              // ),
              // CarouselSlider(
              //   items: [

              //   ],
              //   options: CarouselOptions(
              //     viewportFraction: 0.65,
              //     enlargeCenterPage: true,
              //     enlargeStrategy: CenterPageEnlargeStrategy.scale,
              //     height: 300.h,
              //     padEnds: false,
              //     disableCenter: true,
              //   ),
              // ),
              // // SizedBox(height: 20.h),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required String title,
    required String desc,
    required String imgUrl,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        // height: Get.width * 0.15,
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.h, top: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.contain,
                  height: Get.width * 0.15,
                  width: Get.width * 0.15,
                  color: kPrimaryColor,
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
