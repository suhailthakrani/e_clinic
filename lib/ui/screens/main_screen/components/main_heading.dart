import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        alignment: Alignment.centerLeft,
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
                color: Colors.blue,
                fontFamily: "Helvetica Now Display",
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
