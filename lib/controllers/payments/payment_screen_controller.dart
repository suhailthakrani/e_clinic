import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/payments/components/payment_method_card.dart';

class PaymentsController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  RxInt selectedPaymentIndex = 0.obs;
  
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

  void selectPaymentMethod(int index) {
    // for (var item in paymentMethods) {
    //   item.selected = false;
    // }
    selectedPaymentIndex.value = index;
    notifyChildrens();
  }
}

class PaymentMethodTypeModel {
  final String title;
  final IconData icon;

  PaymentMethodTypeModel({required this.title, required this.icon});
}
