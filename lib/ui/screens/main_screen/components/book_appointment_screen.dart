import 'dart:developer';

import 'package:e_clinic/controllers/a_new/doctor_list_controller.dart';
import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:e_clinic/ui/widgets/general_date_picker_field.dart';
import 'package:e_clinic/ui/widgets/general_dropdown.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../controllers/a_new/book_appointment_screen_controller.dart';
import '../../../widgets/general_text_field.dart';

class BookAppointmentScreen extends GetView<BookAppointmentScreenController> {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Book Appointment',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GeneralTextField.withBorder(
              tfManager: controller.firstNameController,
              paddingVertical: 0,
              paddingHorizontal: 0,
            ),
            GeneralDropdown.withShadow(
              controller: controller.genderDDontroller,
              onItemChanged: (item) {
                if(item.toString().toLowerCase() == "physical") {
                  controller.paymentController.controller.text = 'RS. ${controller.doctor.value.charges.physical}'; 
                } else{
                  controller.paymentController.controller.text = 'RS. ${controller.doctor.value.charges.virtual}';
                }
              },
            ),
             GeneralTextField.withBorder(
              tfManager: controller.paymentController,
              paddingVertical: 0,
              paddingHorizontal: 0,
              readOnly: true,
            ),
            
            GeneralTextField.withBorder(
              tfManager: controller.emailController,
              paddingVertical: 0,
              paddingHorizontal: 0,
            ),
            GeneralTextField.withBorder(
              tfManager: controller.phoneNoController,
              paddingVertical: 0,
              paddingHorizontal: 0,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Choose Date",
                  style: TextStyle(
                    fontSize: 20.w,
                    fontWeight: FontWeight.w500,
                    color: kDarkGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Choose Time Slot",
                  style: TextStyle(
                    fontSize: 20.w,
                    fontWeight: FontWeight.w500,
                    color: kDarkGreyColor,
                  ),
                ),
              ],
            ),
            TimeSelector(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Medical History",
                    style: TextStyle(
                      fontSize: 16.w,
                      fontWeight: FontWeight.w500,
                      color: kDarkGreyColor,
                    ),
                  ),
                ),
                Text(
                  "No File Choosen",
                  style: TextStyle(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w500,
                    color: kDarkGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            GeneralTextField.withBorder(
              tfManager: controller.messageController,
              paddingVertical: 0,
              paddingHorizontal: 0,
            ),
            GeneralButton(
              onPressed: () async {
                await controller.bookAppointment();
              },
              text: "Book Appointment",
              margin: 0,
              color: kPrimaryColor,
              radius: 15,
              height: 60,
            ),
            SizedBox(height: 70),
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
