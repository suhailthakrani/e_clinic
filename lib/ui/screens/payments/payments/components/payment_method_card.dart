import 'package:e_clinic/utils/colors.dart';

import '../../../../../controllers/payments/payment_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class PaymentMethodCard extends GetView<PaymentsController> {
  const PaymentMethodCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);
  final int index;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => Obx(
        ()=> GestureDetector(
          onTap: () {
            controller.selectPaymentMethod(index);
          },
          child: AnimatedOpacity(
            opacity: controller.selectedPaymentIndex.value == index ? 1.0 : 0.7,
            duration: const Duration(milliseconds: 350),
            child: Material(
              borderRadius: BorderRadius.circular(16.w),
              elevation:  controller.selectedPaymentIndex.value == index  ? 10 : 0,
              child: Container(
                height: 60.h,
                width: 160.w,
                decoration: BoxDecoration(
                  color:  controller.selectedPaymentIndex.value == index  ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color:  controller.selectedPaymentIndex.value == index  ? Colors.white : Colors.black,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      text,
                      style: TextStyle(
                        color:  controller.selectedPaymentIndex.value == index  ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
