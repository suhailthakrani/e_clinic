import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_page/widgets/instant_appointment_card.dart';
import '../main_screen/components/list_of_slider_items.dart';
import '../main_screen/components/main_heading.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    labelPadding: EdgeInsets.zero,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: kPrimaryColor,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.shade700,
                    labelStyle: const TextStyle(
                      // fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: [
                      Tab(
                          child: Container(
                        color: kGreenColor,
                        child: Text(
                          'Psychologist',
                        ),
                      )),
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
    );
  }
}
