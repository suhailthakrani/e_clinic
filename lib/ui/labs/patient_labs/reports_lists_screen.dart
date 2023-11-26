import 'package:e_clinic/ui/labs/patient_labs/widgets/lab_card.dart';
import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

import '../../../controllers/labs/lab_list_screen_controller.dart';
import '../../../controllers/labs/reports_list_screen_controller.dart';
import '../../../utils/colors.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ReposrtListScreen extends GetView<ReportsListScreenController> {
  const ReposrtListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Report List',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: 20.h),
                if (controller.labList.isEmpty)
                  Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                else
                  for (int i = 0; i < controller.labList.length; i++)
                    InkWell(
                      onTap: () {
                        Get.to(const FullScreenImageView(imageUrl: 'assets/images/verification.png'));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        padding: EdgeInsets.all(16.w),
                        width: Get.width,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10.w,
                              spreadRadius: 5.w,
                              offset: Offset(0.w, 5.w),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              "${controller.labList[i].name}",
                              height: 90,
                              width: 90,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: kFieldGreyColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                  child: Text(
                                    "Image \nNot Loaded!",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    convertDateFormat(
                                        controller.labList[i].createdAt),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String convertDateFormat(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('d MMMM y').format(dateTime);
  return formattedDate;
}

String convertToAMPM(String timeString) {
  DateTime dateTime = DateFormat('HH:mm').parse(timeString);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageView({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
      ),
      body: PhotoView(
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        imageProvider: NetworkImage(imageUrl),
        // imageProvider: AssetImage(imageUrl),
      ),
    );
  }
}
