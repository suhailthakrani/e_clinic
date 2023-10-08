import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/date_time_manager.dart';


class GeneralDatePickerField extends StatelessWidget {

  final DateTimeManager dateManager;
  final double paddingHorizontal;
  final double paddingVertical;
  bool _withShadow=false;
  final bool readOnly;
  final VoidCallback? onDateChange;

  GeneralDatePickerField.withShadow({super.key,
    required this.dateManager,
    this.paddingHorizontal=4,
    this.paddingVertical = 10,
    this.readOnly = false,
    this.onDateChange,
  }){
    _withShadow=true;
  }

  GeneralDatePickerField.withBorder({super.key,
    required this.dateManager,
    this.paddingHorizontal=0,
    this.readOnly=false,
    this.paddingVertical = 10,
    this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateManager.fieldName, style: const TextStyle(color: kTextColor, fontSize: 14),),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: readOnly ? null : _selectDate,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_withShadow ? 4 : 1),
                border:  _withShadow ? null : Border.all(color: kFieldBorderColor),
                color: readOnly ? kFieldGreyColor : _withShadow ? kWhiteColor : kFieldGreyColor,
                boxShadow: _withShadow ? [
                  const BoxShadow(blurRadius: 3,spreadRadius: 1, color: kFieldShadowColor)
                ] : null,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(()=> Flexible(child: Text("${dateManager.formattedDateTime.isEmpty ? 'Select ${dateManager.fieldName}' : dateManager.formattedDateTime}", overflow :TextOverflow.ellipsis, style: TextStyle(fontSize: 16, color: dateManager.formattedDateTime.isEmpty ? kTextHintColor: kTextColor),))),
                  const Icon(Icons.calendar_month, color: kTextHintColor,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Obx(() => Visibility(
            visible: dateManager.errorMessage.value.isNotEmpty,
            child: Text(dateManager.errorMessage.value, style: const TextStyle(color: kRequiredRedColor),),
          )),

        ],
      ),
    );
  }

  void _selectDate() async {
    try {
      var initDate = dateManager.dateTime??(
          dateManager.firstDate.isAfter(DateTime.now()) ? dateManager.firstDate : dateManager.lastDate
      );
      final date = await showDatePicker(
        context: Get.context!,
        initialDate: initDate,
        firstDate: dateManager.firstDate,
        lastDate: dateManager.lastDate,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: kPrimaryColor,
              buttonTheme:  ButtonThemeData(buttonColor: kPrimaryColor), colorScheme:  ColorScheme.light(primary: kPrimaryColor).copyWith(secondary: kPrimaryColor),
            ),
            child: child!,
          );
        },
      );
      if (date!=null) {
        dateManager.validateDate(date: date);
        if(onDateChange != null) {
          onDateChange!();
        }
      }
    } catch (_) {}
  }


}
