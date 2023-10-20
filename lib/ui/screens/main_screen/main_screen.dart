import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:e_clinic/ui/widgets/general_text_field.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../../../ui/widgets/button1.dart';
import '../../../../ui/widgets/custom_drawer.dart';
import '../../../../ui/widgets/custom_scaffold.dart';
import '../../../../ui/widgets/widget_svg.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/new/main_screen_controller.dart';
import '../../widgets/custom_search_field.dart';
import '../a_new/doctor_details_screen.dart';
import 'components/instant_appointment_card.dart';
import 'components/list_of_slider_items.dart';
import 'components/main_heading.dart';

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
                  () => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.doctorsCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: Get.width * 0.4,
                        child: buildCard(
                          title: controller.doctorsCategories[index].dept,
                          desc:
                              '${controller.doctorsCategories[index].noOfDr} Specialists',
                          imgUrl: controller.doctorsCategories[index].image,
                        ),
                      );
                    },
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
                child: controller.doctorsList.isNotEmpty
                    ? Obx(
                        () => ListView.builder(
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
                                Get.toNamed(kDoctorsDetailsScreenRoute,
                                    parameters: {
                                      'doctor': jsonEncode(
                                          controller.doctorsList[index])
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
                                          child: Image.network(
                                            controller.doctorsList[index].image,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, child,
                                                    loadingProgress) =>
                                                const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Positioned(
                                      top: Get.width * 0.30,
                                      // bottom: 100,
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Container(
                                          width: double.maxFinite,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "${controller.doctorsList[index].firstName} ${controller.doctorsList[index].lastName}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                controller.doctorsList[index]
                                                    .specialization,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: kFieldShadowColor,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      CupertinoIcons.time,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "${controller.doctorsList[index].workingHours.startTime} to ${controller.doctorsList[index].workingHours.endTime}",
                                                      style: const TextStyle(
                                                        color: kBlack90Color,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Text(
                                                " 5 Year + Experience",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
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
                        ),
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
              margin: EdgeInsets.all(16.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.contain,
                  height: Get.width * 0.12,
                  width: Get.width * 0.12,
                  color: kPrimaryColor,
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
