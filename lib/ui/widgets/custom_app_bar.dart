
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import 'widget_svg.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String screenName;
  const CustomAppBar({super.key, required this.scaffoldKey, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: Get.width * 0.4,
      backgroundColor: kWhiteColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: WSvgWidget(
          imageUrl: 'assets/images/logo.svg',
          height: 120,
        ),
      ),
      title: Text(screenName),
      actions: [
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.notifications,
        //       color: kBlack45Color,
        //     )),
        SizedBox(
          width: 60,
          height: 10,
          child: Card(
            margin: const EdgeInsets.all(8),
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/doctor.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(8)),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/drawer_icon.png',
              fit: BoxFit.contain,
              height: 30,
              width: 30,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        )
      ],
    );
  }
}
