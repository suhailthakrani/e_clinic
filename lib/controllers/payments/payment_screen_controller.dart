import 'dart:math';

import 'package:e_clinic/models/response_model.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:e_clinic/ui/widgets/custom_dialogs.dart';
import 'package:e_clinic/ui/widgets/custom_progress_dialog.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedPaymentIndex = 0.obs;

  RxString appointmentId = ''.obs;

  TextEditingController cardNoCOntroller = TextEditingController();
  TextEditingController cardHolderNameCOntroller = TextEditingController();
  TextEditingController expiryDateCOntroller = TextEditingController();
  TextEditingController cvcCOntroller = TextEditingController();

  RxList<PaymentMethodTypeModel> paymentMethods = [
    PaymentMethodTypeModel(
      title: "Credit Card",
      icon: Icons.credit_card,
    ),
    PaymentMethodTypeModel(
      title: "Credit Card",
      icon: Icons.credit_card,
    ),
  ].obs;

  @override
  void onInit() {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    if (arguments != null && arguments.isNotEmpty) {
      appointmentId.value = arguments['id'] ?? '';
    }
    super.onInit();
  }

  void selectPaymentMethod(int index) {
    selectedPaymentIndex.value = index;
    notifyChildrens();
  }

  bool isAllDataValid() {
    bool isValid = true;
    if (cardNoCOntroller.text.isEmpty) {
      CommonCode().showToast(message: "Card Number is Required");
    }
    if (cardHolderNameCOntroller.text.isEmpty) {
      CommonCode().showToast(message: "Card Holder Name is Required");
    }
    if (expiryDateCOntroller.text.isEmpty) {
      CommonCode().showToast(message: "Expiry Date is Required");
    }
    if (cvcCOntroller.text.isEmpty) {
      CommonCode().showToast(message: "CVC Number is Required");
    }
    isValid = isValid &
        cardNoCOntroller.text.isNotEmpty &
        cardHolderNameCOntroller.text.isNotEmpty &
        cvcCOntroller.text.isNotEmpty &
        expiryDateCOntroller.text.isNotEmpty;
    return isValid;
  }

  Future<void> confrimPayment() async {
    if (isAllDataValid()) {
      ProgressDialog pd = ProgressDialog()..showDialog();
      ResponseModel responseModel = await AppointmentService()
          .confrimPayment(appointmentId: appointmentId.value);
      pd.dismissDialog();
      if (responseModel.message == 'Success') {
        CustomDialogs().showAwesomeConfirmationDialog(
            'You have Successfully created an Appointment!',
            onOkBtnPressed: () {
          Get.offAllNamed(kMainScreenRoute);
        });
      }
    } else {
      print("object");
    }
  }
}

class PaymentMethodTypeModel {
  final String title;
  final IconData icon;

  PaymentMethodTypeModel({required this.title, required this.icon});
}
