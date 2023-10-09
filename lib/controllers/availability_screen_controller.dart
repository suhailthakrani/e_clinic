import '../utils/common_code.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/availability_model.dart';

class AvailabilityController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager timeSlotController = TextFieldManager('Time Slot Duration',
      length: 50, filter: TextFilter.none);
  TextFieldManager assignSessionController =
      TextFieldManager('Assign Session #', length: 50, filter: TextFilter.none);

  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  RxInt selectedIndex = 0.obs;

  RxList<AvailabilityModel> availabilityList = <AvailabilityModel>[
    AvailabilityModel(
        day: 'monday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'tuesday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'wednesday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'thursday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'friday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'saturday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'sunday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
  ].obs;

  Future<String> showTimestampPicker(BuildContext context, int index) async {
    TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input);
    if (selectedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      if (index == 0) {
        selectedStartTime = selectedTime;
      }

      String formattedTimestamp = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ")
          .format(selectedDateTime.toLocal());
      return formattedTimestamp;
    }
    return '';
  }

  void toggleStatus({required int index, required bool value}) {
    availabilityList[index] = availabilityList[index].copyWith(isActive: value);
    notifyChildrens();
  }
}
