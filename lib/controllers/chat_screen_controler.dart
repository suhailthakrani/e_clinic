import 'dart:convert';

import 'package:e_clinic/services/messages_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';
import '../ui/screens/messages/components/message_tile.dart';

class MessagesController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // List<MessageSend> messagesSendList = [];
  RxList<MessageGet> conservationList = RxList([]);

  @override
  Future<void> onInit() async {
    conservationList.value = await MessagesService().getAllConservations();
    super.onInit();
  }

  


  // void sortByPinned() {
  //   for (var element in conservationList) {
  //     if (element.n) {
  //       messages.remove(element);
  //       messages.insert(0, element);
  //     }
  //   }
  // }
}