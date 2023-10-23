import 'package:e_clinic/controllers/payments/payment_screen_controller.dart';
import 'package:e_clinic/ui/widgets/button2.dart';
import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/input_field.dart';
import 'components/payment_method_card.dart';
import 'components/small_info_button.dart';

class PaymentsScreen extends GetView<PaymentScreenController> {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Confrim Payment',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.w),
                  Text(
                    "Confrim Your Payment",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.h),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Obx(
                () => Row(
                  children: [
                    for (int index = 0;
                        index < controller.paymentMethods.length;
                        index++)
                      PaymentMethodCard(
                          text: controller.paymentMethods[index].title,
                          icon: controller.paymentMethods[index].icon,
                          index: index)
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Card Number",
                  style: TextStyle(
                    fontFamily: "Helvetica Now Display",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 50.h,
                width: Get.width * 0.9,
                child: InputField(
                  controller: controller.cardNoCOntroller,
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/master-card.png"),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.credit_card),
                      )
                    ],
                  ),
                  hint: "5261 4141 0151 8472",
                  label: "",
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "CardHolder Name",
                  style: TextStyle(
                    fontFamily: "Helvetica Now Display",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 50.h,
                width: Get.width * 0.9,
                child: InputField(
                  controller: controller.cardHolderNameCOntroller,
                  hint: "Christie Doe",
                  label: "",
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Expiry Date",
                          style: TextStyle(
                            fontFamily: "Helvetica Now Display",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 56.h,
                          width: Get.width * 0.45,
                          child: InputField(
                            controller: controller.expiryDateCOntroller,
                            hint: "MM/YY",
                            label: "",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "CVV / CVC",
                              style: TextStyle(
                                fontFamily: "Helvetica Now Display",
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            const SmallInfoButton()
                          ],
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 56.h,
                          width: Get.width * 0.45,
                          child: InputField(
                            controller: controller.cvcCOntroller,
                            hint: "CVV / CVC",
                            label: "",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              const Text(
                "We will send you details to your email after the successfull payment",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 50.h),
              Button2(
                text: "Confrim Payment",
                onPress: () {
                  controller.confrimPayment();
                  // Navigator.pushNamed(
                  //     context, VerificationScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
