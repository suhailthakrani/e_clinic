import 'dart:math';

import 'package:e_clinic/models/appointment_model.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:e_clinic/utils/date_time_manager.dart';
import 'package:e_clinic/utils/text_filter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../ui/widgets/ratings_card.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';

class BookAppointmentScreenController extends GetxController {


  Rx<String> doctorId = RxString('');

  RxList<String> halfHourSlots = List.generate(32, (index) {
    int hour = (index + 16) ~/ 2; // Start from 8 AM (16 slots ahead)
    int minute = (index % 2) * 30;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }).obs;

  RxString degreeDocument = ''.obs;

  RxString selectedTime = ''.obs;
  Rx<DateTime?> selectedDate = DateTime.now().obs;

  TextFieldManager firstNameController = TextFieldManager('Patient Name', length: 50, filter: TextFilter.name,);
  TextFieldManager emailController = TextFieldManager('Email', length: 50, filter: TextFilter.email);
  TextFieldManager phoneNoController = TextFieldManager('Phone Number', length: 50, filter: TextFilter.number);
    TextFieldManager messageController = TextFieldManager('Message', length: 300, filter: TextFilter.name, hint: 'Write Message');

   DropdownController genderDDontroller = DropdownController(title: 'Appointment Type', items: RxList([
    'SELECT',
    'Online',
    'Offline',
  ]));

  @override
  void onInit() {
    doctorId.value = Get.arguments['drID']??'';
    super.onInit();
  }
  

  void onChanged(String time) {
    selectedTime.value = time;
    notifyChildrens();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    selectedDate.value = dateRangePickerSelectionChangedArgs.value;
  }

  bool isAllValid() {
   
    bool isValid = true;
    isValid = isValid & firstNameController.validate()
    & genderDDontroller.validate()
    & (selectedDate.value != null) 
    & selectedTime.isNotEmpty;
    return isValid;
  }

  Future<void> bookAppointment() async {
    AppointmentModel appointment = AppointmentModel(
        id: '', 
        date: selectedDate.value!, 
        time: selectedTime.value, 
        type: genderDDontroller.selectedItem.value, 
        patientName: firstNameController.controller.text, 
        message: messageController.controller.text, 
        doctorId: doctorId.value,
      );
      print('====================${appointment.toJson()}');

    if(isAllValid()) {
      
      
      String response = await AppointmentService().bookAppointment(appointment: appointment);
    if (response == "Success") {
      CommonCode().showSuccessToast(
        message: "The Appointment has been Accepted!",
      );
    } else {
      CommonCode().showToast(
        message: response,
      );
    }
    }

  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      degreeDocument.value = image.path;
    } else {
      print('---------------------- [Unable to Pick Image!]');
    }
  }

 
}
