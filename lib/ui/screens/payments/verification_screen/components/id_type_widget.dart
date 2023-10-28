import '../../../../../controllers/payments/id_verification_controller.dart';
import '../../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class IdTypeWidget extends GetView<IdVerificationController> {
  IdTypeWidget({
    Key? key,
    required this.selected,
    required this.text,
  }) : super(key: key);

  final String text;
  bool selected;

  @override
  Widget build(BuildContext context) {
  
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => Obx(() => InkWell(
        onTap: () {
          controller.selectIdType(
            controller.selectedIndex.value
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 85.h,
          width: 85.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? kPrimaryColor : Colors.grey,
              width: selected ? 3.w : 1.w,
            ),
            shape: BoxShape.circle,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),)
    );
  }
}
