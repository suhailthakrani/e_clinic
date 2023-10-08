import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';

class PaymentsController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  RxBool disableEditAcountEdtals = true.obs;
  void changeEditMode(bool enableEditMode) {
    disableEditAcountEdtals.value = enableEditMode;
    notifyChildrens();
  }

  TextFieldManager bankNameController =
  TextFieldManager('Bank Name', length: 50, filter: TextFilter.name);
  TextFieldManager branchNameController =
  TextFieldManager('Branch Name', length: 50, filter: TextFilter.name);
  TextFieldManager accountController =
  TextFieldManager('Account Number', length: 50, filter: TextFilter.alphaNumeric);
  TextFieldManager accountHolderController =
  TextFieldManager('Account Holder Name', length: 50, filter: TextFilter.name);
  

  TextFieldManager requestAmountController = TextFieldManager('Request Payment', length: 50, filter: TextFilter.email);
  TextFieldManager descriptionController = TextFieldManager('Description', length: 50, filter: TextFilter.none);
  
  DropdownController accountNumberDDController = DropdownController(
    title: "Choose Card",
    items: ["6011 **** **** 2239", "3011 **** **** 2139"].obs,
  );

}

class PaymentMethodTypeModel {
  final String title;
  final IconData icon;

  PaymentMethodTypeModel({required this.title, required this.icon});
}
