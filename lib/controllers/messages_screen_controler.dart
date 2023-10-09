import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/messages/components/message_tile.dart';

class MessagesController extends GetxController {

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  
  RxList<MessageTile> messages = [
    MessageTile(
      image: "assets/images/doctor.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: false,
    ),
    MessageTile(
      image: "assets/images/doctor2.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: false,
    ),
    MessageTile(
      image: "assets/images/doctor.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: false,
    ),
    MessageTile(
      image: "assets/images/doctor.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: false,
    ),
    MessageTile(
      image: "assets/images/doctor2.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: false,
    ),
    MessageTile(
      image: "assets/images/doctor.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: true,
    ),
    MessageTile(
      image: "assets/images/doctor2.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: true,
    ),
    MessageTile(
      image: "assets/images/doctor.png",
      receiverName: "Dr Rebbeka",
      recentMessage: "You will get instant service from Dr Rebbeka",
      recentMessageTime: "12:00",
      pinned: false,
    ),
  ].obs;

  void sortByPinned() {
    for (var element in messages) {
      if (element.pinned) {
        messages.remove(element);
        messages.insert(0, element);
      }
    }
  }
}