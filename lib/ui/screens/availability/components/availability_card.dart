import '../../../../controllers/availability_screen_controller.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SingleAvailabilityWidget extends GetView<AvailabilityController> {
  final int index;

  const SingleAvailabilityWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: controller.availabilityList[index].isActive,
                  onChanged: (value) {
                    print(value);
                    controller.toggleStatus(index: index, value: value);
                  },
                ),
                Text(controller.availabilityList[index].day.capitalizeFirst ??
                    ''),
              ],
            ),
            Visibility(
              visible: controller.availabilityList[index].isActive,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Start Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              String value = await controller
                                  .showTimestampPicker(context, 0);

                              controller.availabilityList[index] = controller
                                  .availabilityList[index]
                                  .copyWith(startTime: value);
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBlack45Color,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  controller.availabilityList[index].startTime
                                          .isNotEmpty
                                      ? "${DateTime.parse(controller.availabilityList[index].startTime).hour.toString().padLeft(2, '0')}:${DateTime.parse(controller.availabilityList[index].startTime).minute.toString().padLeft(2, '0')}"
                                      : 'Select',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'End Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              String value = await controller
                                  .showTimestampPicker(context, 1);
                              controller.availabilityList[index] = controller
                                  .availabilityList[index]
                                  .copyWith(endTime: value);
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBlack45Color,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  controller.availabilityList[index].endTime
                                          .isNotEmpty
                                      ? "${DateTime.parse(controller.availabilityList[index].endTime).hour.toString().padLeft(2, '0')}:${DateTime.parse(controller.availabilityList[index].endTime).minute.toString().padLeft(2, '0')}"
                                      : 'Select',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Icon(
                          CupertinoIcons.delete,
                          color: kRequiredRedColor,
                        ),
                      )),
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: !(controller.availabilityList[index].isActive),
                child: const Text("Unavailable"),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.add,
                    )),
                const SizedBox(width: 16.0),
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/copy.png',
                      width: 50.w,
                      height: 50.h,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
