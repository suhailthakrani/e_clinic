import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:e_clinic/controllers/messages_screen_controler.dart';
import 'package:e_clinic/models/me_model.dart';
import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/models/token_model.dart';
import 'package:e_clinic/services/messages_service.dart';
import 'package:e_clinic/services/socket_service.dart';
import 'package:e_clinic/services/user_service.dart';
import 'package:e_clinic/ui/screens/messages/components/chat_reciever_item.dart';
import 'package:e_clinic/ui/screens/messages/components/chat_sender_item.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:e_clinic/utils/user_session.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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
  MeModel meModel = MeModel.fromJson({});
  TextEditingController controller = TextEditingController();
  late io.Socket socket;

  List<Message> chatMessages = [];

  @override
  void initState() {
    super.initState();
    call();
  }

  Future<void> call() async {
    meModel = await UserSession().getMe();
    await connectToServer();
  }

  Future<void> connectToServer() async {
    try {
      // Connect to the server
      socket = io.io('https://api.eclinic.live', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });

      // Add event listeners
      socket.on('connect', (_) {
        print('Connected to server');
        // Join the chat room or perform any necessary setup
        socket.emit("join", [widget.message.id, meModel.id]);
        socket.emit('set-user', widget.message.participant.id);
        // socket.emit('leave', widget.message.id);
      });

      socket.on('new-messages', (data) {
        print("-------------${data}");
        setState(() {
          chatMessages.add(Message.fromJson(data ?? {}));
        });
      });
      socket.on('message', (data) {
        print("-------------${data}");
        setState(() {
          chatMessages.add(Message.fromJson(data ?? {}));
        });
      });

      // Connect to the server
      socket.connect();
    } catch (e) {
      print('Error: $e');
    }
  }

  void sendMessage(Message message) {
    if (!socket.connected) {
      socket.connect();
    }

    setState(() {
      chatMessages.add(message);
    });
    socket.on('new-messages', (data) {
      print("-------------${data}");
      setState(() {
        chatMessages.add(Message.fromJson(data ?? {}));
      });
    });
    socket.emit('message', {
        "conversationId": widget.message.id,
        "message": message.message,
        "sender": meModel.id,
        "receiver": widget.message.participant.id
      });
    // socket.emit('message', message.toJson());
  }

  @override
  void dispose() {
    socket.disconnect(); // Disconnect the socket when the widget is disposed
    super.dispose();
  }

  // WebSocket? ws;

  // @override
  // void initState() {
  //   super.initState();
  //   call();
  // }

  // Future<void> call() async {
  //   await connectToServer();
  // }

  // void sendMessage(MessageSend messageSend) {
  //   print("-------------${ws != null && ws!.readyState == WebSocket.open}");
  //   if (ws != null && ws!.readyState == WebSocket.open) {
  //     ws!.add(jsonEncode(messageSend.toJson()));
  //     print("-------------${ws?.done}");
  //   } else {
  //     print('WebSocket connection is not open.');
  //   }
  // }

  void handleMessage(Message message) {
    setState(() {
      chatMessages.add(message);
    });
  }

  // @override
  // void dispose() {
  //   ws?.close(); // Close the WebSocket connection when the widget is disposed
  //   super.dispose();
  // }

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
              // ... Existing code ...

              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final message = chatMessages[index];
                  if (message.senderId == meModel.id) {
                    return chatSenderWidget(message);
                    //    return ListTile(
                    //   title: Text(message.message),
                    //   subtitle: Text(
                    //     '${message.participant.firstName} ${message.participant.lastName}',
                    //   ),
                    // );
                  } else {
                    return chatRecieverWidget(message);
                    //  return ListTile(
                    // title: Text(message.message),
                    // subtitle: Text(
                    //   '${message.participant.firstName} ${message.participant.lastName}',
                    // ),
                  }
                },
              ),

              // ... Existing code ...
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
                  // height: 45.h,
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
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kGreyColor)),
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
                  print("====```````````===================${controller.text}");
                  Message msg = Message(
                    recieverId: widget.message.participant.id,
                    senderId: meModel.id,
                    participant: Participant(
                        id: meModel.id,
                        firstName: meModel.firstName,
                        lastName: meModel.lastName),
                    unreadCount: 3.toString(),
                    message: controller.text,
                  );

                  sendMessage(msg);

                  controller.clear();
                },
                child: const SendButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Future<void> connectToServer() async {
//     try {
//       Random r = Random();
//       String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));

//       HttpClient client = HttpClient();
//       HttpClientRequest request =
//           await client.getUrl(Uri.parse('https://api.eclinic.live'));
//       request.headers.add('connection', 'Upgrade');
//       request.headers.add('upgrade', 'websocket');
//       request.headers.add('Sec-WebSocket-Version', '13');
//       request.headers.add('Sec-WebSocket-Key', key);
//       HttpClientResponse response = await request.close();

//       print("========================${response.connectionInfo?.localPort}");
//       print("========================${response.headers}");
//       Socket socket = await response.detachSocket();

//       ws = WebSocket.fromUpgradedSocket(socket, serverSide: false);

//       ws?.listen((event) {
//         final Map<String, dynamic> jsonMessage = jsonDecode(event);
//         handleMessage(MessageGet.fromJson(jsonMessage));
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
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
