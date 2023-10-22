import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/models/appointment_model.dart';
import 'package:e_clinic/models/response_model.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:e_clinic/ui/screens/payments/confrim_payment_screen.dart';
import 'package:e_clinic/ui/widgets/custom_dialogs.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:e_clinic/utils/date_time_manager.dart';
import 'package:e_clinic/utils/text_filter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../models/doctor_model.dart';
import '../../ui/widgets/custom_progress_dialog.dart';
import '../../ui/widgets/ratings_card.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';

class BookAppointmentScreenController extends GetxController {
  Rx<Doctor> doctor = Rx(Doctor.empty());

  RxList<String> halfHourSlots = List.generate(32, (index) {
    int hour = (index + 16) ~/ 2; // Start from 8 AM (16 slots ahead)
    int minute = (index % 2) * 30;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }).obs;

  RxString degreeDocument = ''.obs;

  RxString selectedTime = ''.obs;
  Rx<DateTime?> selectedDate = DateTime.now().obs;

  TextFieldManager firstNameController = TextFieldManager(
    'Patient Name',
    length: 50,
    filter: TextFilter.name,
  );
  TextFieldManager emailController =
      TextFieldManager('Email', length: 50, filter: TextFilter.email);
  TextFieldManager phoneNoController =
      TextFieldManager('Phone Number', length: 50, filter: TextFilter.number);
  TextFieldManager paymentController =
      TextFieldManager('Payment', length: 30, filter: TextFilter.number);
  TextFieldManager messageController = TextFieldManager('Message',
      length: 300, filter: TextFilter.name, hint: 'Write Message');

  DropdownController genderDDontroller = DropdownController(
      title: 'Appointment Type',
      items: RxList([
        'SELECT',
        'ONLINE',
        'PHYSICAL',
      ]));

  @override
  void onInit() {
    Map<String, dynamic> doctors = Get.arguments ??{};
    if(doctors != null && doctors.isNotEmpty) {
      doctor.value = Get.arguments['dr'] ?? Doctor.empty();
    }

    if(doctor.value.charges.physical.isNotEmpty && doctor.value.charges.virtual.isNotEmpty) {
      genderDDontroller.items.value = ['PHYSICAL', 'VIRTUAL'];
    } else if(doctor.value.charges.physical.isNotEmpty) {
      genderDDontroller.items.value = ['PHYSICAL'];
      genderDDontroller.setFirstItem();
      paymentController.controller.text = doctor.value.charges.physical;
    }
    else if(doctor.value.charges.virtual.isNotEmpty) {
      genderDDontroller.items.value = ['VIRTUAL'];
      genderDDontroller.setFirstItem();
      paymentController.controller.text = doctor.value.charges.virtual;
    }

    
    
    super.onInit();
  }

  void onChanged(String time) {
    selectedTime.value = time;
    notifyChildrens();
  }

  void onSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    selectedDate.value = dateRangePickerSelectionChangedArgs.value;
  }

  bool isAllValid() {
    bool isValid = true;
    isValid = isValid &
        firstNameController.validate() &
        genderDDontroller.validate() &
        (selectedDate.value != null) &
        selectedTime.isNotEmpty;
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
