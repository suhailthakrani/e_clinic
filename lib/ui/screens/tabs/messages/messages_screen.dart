import 'package:e_clinic/controllers/tabs/messages_screen_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
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
          )
      ),
    );
  }
}
