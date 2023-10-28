import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/ui/screens/messages/chat_screen.dart';
import 'package:e_clinic/ui/screens/messages/components/message_tile.dart';

import '../../../ui/widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/messages_screen_controler.dart';

class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Messages',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16),
          child: Obx(
            () => Column(
              children: [
                // CommonCode().
                for (int i = 0; i < controller.conservationList.length; i++)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              message: MessageSend(
                                id: controller.conservationList[i].id,
                                participant: controller.conservationList[i].participant,
                                message: '',
                              ),
                            ),
                          ));
                    },
                    child: MessageTile(
                        image: "assets/images/doctor.png",
                        pinned: false,
                        receiverName:
                            "Dr. ${controller.conservationList[i].participant.firstName} ${controller.conservationList[i].participant.lastName}",
                        recentMessage:
                            "Continue Chatting with Dr. ${controller.conservationList[i].participant.firstName} ${controller.conservationList[i].participant.lastName}",
                        recentMessageTime:
                            "${DateTime.now().hour}:${DateTime.now().minute}"),
                  ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Center(
                    child: Text(
                      "You have reached the end.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
