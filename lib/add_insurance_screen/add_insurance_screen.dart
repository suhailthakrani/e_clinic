import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../address_screen/address_screen.dart';
import '../util/button1.dart';
import '../util/colors.dart';
import '../util/text_styles.dart';
import 'insurance_cards_screen.dart';

class AddInsuranceScreen extends StatelessWidget {
  const AddInsuranceScreen({Key? key}) : super(key: key);

  static const routeName = "addinsurance";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            builder: (context, widget) => Container(
              margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
              child: Center(
                child: Column(
                  children: [
                    Text("Add Insurance", style: textTheme.headline1),
                    SizedBox(height: 70.h),
                    Image.asset("assets/images/insurance.png"),
                    SizedBox(height: 190.h),
                    Container(
                      height: 52.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        // apply shadow to the container
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            // shadow on botom and right
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Button1(
                        textStyle: textTheme.button!,
                        buttonColor: button2Color,
                        text: "Add Insurance",
                        borderRadius: 30,
                        onPress: () {
                          Navigator.pushNamed(
                              context, InsuranceCardsScreen.routeName);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 52.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        // apply shadow to the container
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            // shadow on botom and right
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Button1(
                        textStyle: textTheme.button!,
                        buttonColor: button2Color,
                        text: "Skip And Continue",
                        borderRadius: 30,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            AddressScreen.routeName,
                          );
                        },
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
