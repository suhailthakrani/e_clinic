import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:e_clinic/ui/widgets/general_text_field.dart';

import '../../../../ui/widgets/button1.dart';
import '../../../../ui/widgets/custom_drawer.dart';
import '../../../../ui/widgets/custom_scaffold.dart';
import '../../../../ui/widgets/widget_svg.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/new/main_screen_controller.dart';
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            GeneralTextField.withShadow(tfManager: controller.searchController),
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
    );
  }

  Widget buildCard({
    required String title,
    required String desc,
    required String imgUrl,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: Get.height * 0.15,
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imgUrl,
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
    );
  }
}
