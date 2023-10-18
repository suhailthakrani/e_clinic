import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:e_clinic/ui/widgets/general_text_field.dart';
import 'package:e_clinic/utils/constants.dart';

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
          toolbarHeight: 70,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
          physics: BouncingScrollPhysics(),
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
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: Get.width * 0.4,
                        child: buildCard(
                            title: "Cardiology",
                            desc: '12 Specialists',
                            imgUrl: "assets/images/doctor.png"));
                  },
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
                height: Get.height * 0.3,
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
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
                        Get.toNamed(kDoctorsDetailsScreenRoute);
                      },
                      child: Container(
                        width: Get.width * 0.5,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              height: Get.width * 0.3,
                              width: Get.height * 0.17,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  index % 2 == 0
                                      ? "assets/images/doctor.png"
                                      : "assets/images/doctor2.png",
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "doctorName",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        "doctorDepartment",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "Monday to Friday",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
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
      margin: EdgeInsets.all(8),
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
            CircleAvatar(
              radius: 24,
              backgroundColor: kPrimaryColor.withOpacity(0.15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
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
                fontSize: 11,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
