import '../../../ui/widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/messages_screen_controler.dart';

class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Messages',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
          child: ScreenUtilInit(
            designSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            builder: (context, w) => Center(
              child: Obx(
                () => Column(
                  children: [
                    ...controller.messages,
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Center(
                        child: Text(
                          "You have reached the end.",
                          style: TextStyle(color: Colors.grey),
                        ),
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
