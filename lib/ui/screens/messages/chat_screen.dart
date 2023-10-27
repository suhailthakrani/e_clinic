import 'package:device_preview/device_preview.dart';
import 'package:e_clinic/ui/screens/messages/components/audio_tile.dart';

import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/input_field.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leadingWidth: 32.w,
          title: const Row(
            children: [
              CircleAvatar(
                radius: 20,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chat'),
                  Text(
                    "Online",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.video_call_outlined, color: kPrimaryColor, size: 35.h,),
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
          child: ScreenUtilInit(
            designSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            builder: (context, w) => Container(
              padding: EdgeInsets.only(left:16.w, right: 16.w, bottom: 16),
              child: Column(
                children: [
                  const RecieverDetails(),
                  const ChatStartTime(),
                  SizedBox(height: 20.h),
                  const RecieverChatItem(
                    text: "Hey, James here. How can i help you?",
                  ),
                  SizedBox(height: 20.h),
                 const AudioMessageWidget(duration: '23:00', isSender: true),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          width: 275.w,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.w),
                              bottomLeft: Radius.circular(10.w),
                              topLeft: Radius.circular(10.w),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/patient1.png"),
                              Image.asset("assets/images/patient2.png"),
                              Container(
                                height: 71.h,
                                width: 34.w,
                                decoration: BoxDecoration(
                                  color: greyishColor,
                                  borderRadius: BorderRadius.circular(4.w),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              )
                            ],
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
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Padding(
          padding:  EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MessageBar(),
              SizedBox(width: 5),
              InkWell(
                onTap: () async {
                  // await ShocketService().canRotate;
                },
                child: SendButton(),
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
  const RecieverDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 54,
        ),
        const SizedBox(height: 20),
        const Text(
          "Dr. John Doe",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 30.h,
          width: 200.w,
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
      height: 38.h,
      width: 38.w,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MessageBar extends StatelessWidget {
  const MessageBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45.h,
        width: 320.w,
        child: InputField(
          controller: TextEditingController(),
          hint: "",
          label: "Message",
          prefixIcon: IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.keyboard_voice),
            onPressed: () {},
          ),
        ),
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
            width: 275.w,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.w),
                topLeft: Radius.circular(10.w),
                topRight: Radius.circular(10.w),
              ),
            ),
            child: Text(text),
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
            padding: const EdgeInsets.all(20),
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
