import 'package:carousel_slider/carousel_slider.dart';

import '../home_page/widgets/instant_appointment_card.dart';
import '/../ui/widgets/custom_scaffold.dart';
import '/../utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/main_screen_controller.dart';
import 'components/list_of_slider_items.dart';
import 'components/main_heading.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'MainScreen',
      // appBar: AppBar(),
      // endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
      child: ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        builder: (context, w) => Center(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const SearchBar(),
              SizedBox(height: 10.h),
              const MainHeading(),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: kPrimaryColor,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: const [
                      Tab(
                        text: 'Psychologist',
                      ),
                      Tab(
                        text: 'Cardiologist',
                      ),
                      Tab(
                        text: 'Gastriologist',
                      ),
                      Tab(
                        text: 'Dermatologist',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              CarouselSlider(
                items: [
                  ...slidersItems,
                ],
                options: CarouselOptions(
                  viewportFraction: 0.65,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  height: 300.h,
                  padEnds: false,
                  disableCenter: true,
                ),
              ),
              SizedBox(height: 20.h),
              const InstantAppointmentCard(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    )
      // body: SingleChildScrollView(
      //   padding: EdgeInsets.only(
      //       left: 16,
      //       right: 16,
      //       top: 16,
      //       bottom: MediaQuery.of(context).viewInsets.bottom),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Row(
      //         children: [
                
      //           buildCard(
      //             title: 'Find Doctors',
      //             desc:
      //                 "Ensure to check the doctor's profile for credentials and reviews.",
      //             imgUrl: "assets/images/find_doctors.png",
      //           ),
      //           SizedBox(width: 10),
      //           buildCard(
      //             title: 'Appointments',
      //             desc: "Make doctor appointment online or by phone with ease.",
      //             imgUrl: "assets/images/find_appointments.png",
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 12),
      //       Row(
      //         children: [
      //           buildCard(
      //             title: 'Patient Reports',
      //             desc:
      //                 "Stay up-to-date with your health by accessing your patient report online.",
      //             imgUrl: "assets/images/find_reports.png",
      //           ),
      //           SizedBox(width: 10),
      //           buildCard(
      //             title: 'Prescriptions',
      //             desc:
      //                 "View, download, or print your prescription easily through platform.",
      //             imgUrl: "assets/images/find_prescription.png",
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 12),
      //       Row(
      //         children: [
      //           buildCard(
      //             title: 'Payments',
      //             desc:
      //                 "Skip the hassle of mailing checks or paying in person.",
      //             imgUrl: "assets/images/find_payments.png",
      //           ),
      //           SizedBox(width: 10),
      //           buildCard(
      //             title: 'Lab Management',
      //             desc:
      //                 "Improve lab efficiency and accuracy with Lab management solutions.",
      //             imgUrl: "assets/images/lab_management.png",
      //           ),
      //         ],
      //       ),
      //       SizedBox(height: 100.h),
      //     ],
      //   ),
      // ),
    );
  }

  Widget buildCard({
    required String title,
    required String desc,
    required String imgUrl,
  }) {
    return Expanded(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: Get.height * 0.24,
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  imgUrl,
                  height: Get.width * 0.3,
                  width: 80.w,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
