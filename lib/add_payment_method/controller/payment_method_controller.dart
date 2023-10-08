import 'package:e_clinic/add_payment_method/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxList<PaymentMethodCard> paymentMethods = [
    PaymentMethodCard(
      text: "Credit Card",
      icon: Icons.credit_card,
      selected: false,
    ),
    PaymentMethodCard(
      text: "Apple Pay",
      icon: Icons.apple,
      selected: false,
    ),
  ].obs;

  void selectPaymentMethod(int index) {
    for (var item in paymentMethods) {
      item.selected = false;
    }
    paymentMethods[index].selected = true;
  }
}
