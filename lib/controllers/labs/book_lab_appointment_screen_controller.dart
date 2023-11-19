import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../models/appointment_model.dart';
import '../../models/doctor_model.dart';
import '../../models/response_model.dart';
import '../../models/user_model.dart';
import '../../services/appointment_service.dart';
import '../../services/user_service.dart';
import '../../ui/widgets/custom_dialogs.dart';
import '../../ui/widgets/custom_progress_dialog.dart';
import '../../utils/constants.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';
import '../../utils/user_session.dart';


/// Created by Suhail Thakrani 23-Sep-2023
class BookLabAppointmentScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<Doctor> doctor = Rx(Doctor.empty());

  RxList<String> halfHourSlots = List.generate(32, (index) {
    int hour = (index + 16) ~/ 2; // Start from 8 AM (16 slots ahead)
    int minute = (index % 2) * 30;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }).obs;

  RxString degreeDocument = ''.obs;

  RxString selectedTime = ''.obs;
  Rx<DateTime?> selectedDate = DateTime.now().obs;


  DropdownController selectTestDDontroller = DropdownController(
      title: 'Select Test',
      items: RxList([
        'SELECT',
        'Blood Test',
        'Urine Test',
      ]));
       DropdownController selectLabDDontroller = DropdownController(
      title: 'Select Lab',
      items: RxList([
        'SELECT',
        'Al Lab',
        'Urine Lab',
      ]));


      TextFieldManager firstNameController = TextFieldManager(
    'Patient Name',
    length: 50,
    filter: TextFilter.name,
  );

  @override
  void onInit() {
    Map<String, dynamic> doctors = Get.arguments ??{};
    if(doctors != null && doctors.isNotEmpty) {
      doctor.value = Get.arguments['dr'] ?? Doctor.empty();
    }

    // else if(doctor.value.charges.virtual.isNotEmpty) {
    //   genderDDontroller.items.value = ['VIRTUAL'];
    //   genderDDontroller.setFirstItem();
    //   // paymentController.controller.text = doctor.value.charges.virtual;
    // }

    
    
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
    isValid = isValid &
        firstNameController.validate() &
        // genderDDontroller.validate() &
        (selectedDate.value != null) &
        selectedTime.isNotEmpty;
    return isValid;
  }

  Future<void> bookAppointment() async {
    AppointmentModel appointment = AppointmentModel(
      id: '',
      date: selectedDate.value!,
      time: selectedTime.value,
      type: appontmentid.selectedItem.value,
      patientName: firstNameController.controller.text,
      message: '',
      doctorId: doctor.value.id,
    );
    print('====================${appointment.toJson()}');

    if (isAllValid()) {
      ProgressDialog pd = ProgressDialog()..showDialog();

      ResponseModel response = await AppointmentService().bookAppointment(appointment: appointment);
      pd.dismissDialog();
      if (response.message == "Success") {
        String paymentUrl = response.data['paymentLink'] ?? 'https://checkout.stripe.com/c/pay/cs_test_a10YiUee9RDxLZVuLogPY21LAeFPN0PyBMu0wNZDc7MnvDGBp6Yi54H0GY#fidkdWxOYHwnPyd1blpxYHZxWjA0S21DcURCVmNzZG5WY2o2fWRiMU9udVNQVkNAT2NDcnVKQ31nN3RkVGhDYzwwTEw3aEBqd0EyN1BXdTRscnR%2FM0xGfU1tb21EQEtDQWB2Z0loZGhqYFFHNTVGT3BJVWpgMScpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl';
        String appointmentId = response.data['id'] ??'';
        // Get.offAll(ConfrimPaymentScreen(paymentUrl: paymentUrl, appointmentModel: appointment));
        Get.toNamed(kPaymentScreenRoute, arguments: {'id': appointmentId});
        print("--------------------${response.data}");

      } else {
        CustomDialogs().showDialog("Error",response.message, DialogType.error, );
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
