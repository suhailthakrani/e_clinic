import 'dart:convert';
import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:e_clinic/controllers/messages_screen_controler.dart';
import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/services/messages_service.dart';
import 'package:e_clinic/services/service_urls.dart';
import 'package:e_clinic/services/socket_service.dart';
import 'package:e_clinic/ui/screens/messages/components/audio_tile.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatScreen extends StatefulWidget {
  final MessageSend message;
  const ChatScreen({Key? key, required this.message}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late io.Socket _socket;
  List<MessageGet> receivedMessages = [];
  List<String> messagees = [
    "Good morning! How are you feeling today?",
    "I'm feeling much better, thank you!",
    "That's great to hear! Have you been taking the prescribed medication?",
    "Yes, I've been taking it regularly.",
    "Wonderful! Keep up with the medication and let me know if you have any concerns.",
    "Thank you, Dr. It's been a great help.",
    "Sure thing! I'll make sure to do that.",
  ];

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
    // socketService.socket.on('message', (data) {
    //   setState(() {
    //     var receivedMessage = MessageGet.fromJson(jsonDecode(data));
    //     receivedMessages.add(receivedMessage);
    //   });
    // });
  }

  void connect() {
    try {
  _socket = io.io('https://api.eclinic.live', <String,dynamic> {
    "transports": ['websocket'],
    "autoConnect": false,
  });
  
  log("_)))__)))___))___))__${_socket.auth}");
   
    _socket.connect();
     _socket.onConnect((_) {
  log('Socket connected');
  print('Socket connected');
    });
} on Exception catch (e) {
  log("||||||||||| ${e}");
}
  print('Socket connected OR NOT: ${_socket.connected}');
}

void sendMessage(String message) {
    MessageSend messageSend = MessageSend(
      id: widget.message.participant.id,
      participant: widget.message.participant,
      message: message,
    );

    _socket.emit('message', jsonEncode(messageSend));
  }

  @override
  void dispose() {
    // socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leadingWidth: 40.w,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: ClipRRect(
                  child: Image.asset(
                    widget.message.participant.image ?? '',
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.message.participant.firstName} ${widget.message.participant.lastName}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const Text(
                      "Online",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.video_call_outlined,
                color: kPrimaryColor,
                size: 35.h,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.call, color: kPrimaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 100),
          child: Column(
            children: [
              RecieverDetails(
                participant: widget.message.participant,
              ),
              const ChatStartTime(),
              SizedBox(height: 20.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messagees.length,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return RecieverChatItem(
                      text: messagees[index],
                    );
                  } else {
                    return SenderChatItem(
                      text: messagees[index],
                    );
                  }
                },
              ),
              // for (int index = 0; index < messagees.length; index++)

              SizedBox(height: 20.h),
              // SizedBox(
              //   height: 400,
              //   child: ListView.builder(
              //     itemCount: receivedMessages.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(receivedMessages[index].id),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 45.h,
                  width: 320.w,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.attach_file,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: kGreyColor)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.keyboard_voice,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  print(
                      "====```````````===================${controller.value}");
                  MessageSend messageSend = MessageSend(
                    id: widget.message.participant.id,
                    participant: widget.message.participant,
                    message: controller.text,
                  );
                  print("================qweqweqwe=======${messagees.last}");
                  _socket.send([

                  ]);
                  sendMessage(jsonEncode(messageSend));
                  // SocketService().sendSocketMessage(
                  //     message: messageSend,
                  //     onSent: () {
                  //       CommonCode().showSuccessToast(message: "Message Sent");
                  //     });
                  messagees.add(controller.text);
                  print("=======1111111111================${messagees.last}");
                  setState(() {});
                },
                child: const SendButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatStartTime extends StatelessWidget {
  const ChatStartTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20.h,
      width: 190.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: const Text("06 August, Sunday"),
    );
  }
}

class RecieverDetails extends StatelessWidget {
  final Participant participant;
  const RecieverDetails({
    Key? key,
    required this.participant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 42,
        ),
        const SizedBox(height: 10),
        Text(
          "Dr. ${participant.firstName} ${participant.lastName}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 30.h,
          width: Get.width * 0.8,
          child: const Text(
            "This is a small bio description to let users express themselves",
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: const Icon(
        Icons.send,
        color: Colors.white,
      ),
    );
  }
}

class RecieverChatItem extends StatelessWidget {
  const RecieverChatItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            width: Get.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.w),
                topLeft: Radius.circular(10.w),
                topRight: Radius.circular(10.w),
              ),
            ),
            child:  Text(text),
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "10:00 PM",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class SenderChatItem extends StatelessWidget {
  const SenderChatItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: 275.w,
              minWidth: 100.w,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.w),
                bottomLeft: Radius.circular(10.w),
                topLeft: Radius.circular(10.w),
              ),
            ),
            child: Text(
              
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          alignment: Alignment.centerRight,
          child: const Text(
            "10:00 PM",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
