import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/payments/components/payment_method_card.dart';
import '../../ui/screens/payments/components/verification_screen/components/id_type_widget.dart';

class IdVerificationController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;

  List<IdTypeWidget> idTypes = [
    IdTypeWidget(text: 'Driver', selected: false),
    IdTypeWidget(text: 'Passport', selected: false),
    IdTypeWidget(text: 'ID', selected: false),
  ];

  void selectIdType(int index) {
    for (var item in idTypes) {
      item.selected = false;
    }
    idTypes[index].selected = true;
  }
}
