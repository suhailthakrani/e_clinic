import 'dart:developer';

import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:e_clinic/ui/widgets/general_date_picker_field.dart';
import 'package:e_clinic/ui/widgets/general_dropdown.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../controllers/appointments/book_appointment_screen_controller.dart';
import '../../../controllers/labs/book_lab_appointment_screen_controller.dart';
import '../../widgets/general_text_field.dart';

class BookLabAppointmentScreen
    extends GetView<BookLabAppointmentScreenController> {
  const BookLabAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Book Lab Appointment',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold, color: kTextColor.withAlpha(200)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Effortlessly schedule lab appointments through our user-friendly platform, ensuring a hassle-free experience',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: kTextColor.withAlpha(200)),
            ),
            const SizedBox(height: 16),
            // GeneralTextField.withBorder(
            //   tfManager: controller.firstNameController,
            //   paddingVertical: 0,
            //   paddingHorizontal: 0,
            // ),
            GeneralDropdown.withShadow(
              controller: controller.selectTestDDontroller,
            ),
            // GeneralDropdown.withShadow(
            //   controller: controller.selectLabDDontroller,
            // ),
            const SizedBox(height: 10),
            // Row(
            //   children: [
            //     Text(
            //       "Choose Date",
            //       style: TextStyle(
            //         fontSize: 20.w,
            //         fontWeight: FontWeight.w500,
            //         color: kDarkGreyColor,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: SfDateRangePicker(
                minDate: DateTime.now(),
                selectionColor: kPrimaryColor,
                todayHighlightColor: kPrimaryColor,
                headerHeight: 70,
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                maxDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 30),
                onSelectionChanged: controller.onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            const SizedBox(height: 10),
            // Row(
            //   children: [
            //     Text(
            //       "Choose Time Slot",
            //       style: TextStyle(
            //         fontSize: 20.w,
            //         fontWeight: FontWeight.w500,
            //         color: kDarkGreyColor,
            //       ),
            //     ),
            //   ],
            // ),
            // const TimeSelector(),
            const SizedBox(height: 10),
            GeneralTextField.withBorder(
              tfManager: controller.descriptionController,
              paddingVertical: 0,
              maxLines: 3,
              paddingHorizontal: 0,
            ),
            SizedBox(height: Get.height * 0.02,),
            Align(
              alignment: Alignment.bottomCenter,
              child: GeneralButton(
                onPressed: () async {
                  await controller.boolTest();
                },
                text: "Book Lab Test",
                margin: 0,
                color: kPrimaryColor,
                radius: 15,
                height: 60,
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}

class TimeSelector extends GetView<BookAppointmentScreenController> {
  const TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: controller.halfHourSlots.map((time) {
            return ChoiceChip(
              selectedColor: kPrimaryColor,
              label: Text(time),
              selected: controller.selectedTime.value == time,
              onSelected: (selected) {
                controller.onChanged(time);
                // setState(() {
                //   selectedTime = selected ? time : '';
                // });
              },
            );
          }).toList(),
        ));
  }
}
