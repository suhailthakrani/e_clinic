import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Doctors",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Helvetica Now Display",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "View All",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
