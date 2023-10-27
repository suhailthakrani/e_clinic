import 'dart:convert';

import 'package:e_clinic/services/messages_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';
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

  // Initialize SocketService
SocketService socketService = SocketService();

// Connect to the socket server

// Create and send a message
void sendMessage(String messageId, Participant participant, String message) {
  MessageSend messageSend = MessageSend(
    id: messageId,
    participant: participant,
    message: message,
  );

  // Convert messageSend to JSON
  Map<String, dynamic> jsonMessage = messageSend.toJson();

  // Send the message through the socket
  socketService.createMessage(json.encode(jsonMessage));
}


  void sortByPinned() {
    for (var element in messages) {
      if (element.pinned) {
        messages.remove(element);
        messages.insert(0, element);
      }
    }
  }
}