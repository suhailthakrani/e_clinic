
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/message_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/colors.dart';

Widget chatRecieverWidget(Message msgContent) {
  return Container(
    padding: const EdgeInsets.only(
      top: 10,
      left: 15,
      // right: 15,
      bottom: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Outer Contrainet Box
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 230, maxHeight: 100),
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            // padding: msgContent.type == 'text'
            //     ? const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10)
                // : const EdgeInsets.all(2),
            margin: const EdgeInsets.only( left: 15, right: 15, bottom: 5),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: 
            // msgContent.type == 'text'? 
            InkWell(
                    onTap: () {
                      print(msgContent.message);
                      print("Clicked........................");
                    },
                    child: Text(
                      (msgContent.message),
                      style: TextStyle(fontSize: 14, color: kWhiteColor),
                    ),
                  )
                // : ConstrainedBox(
                //     constraints: const BoxConstraints(
                //       maxWidth: 80,
                //     ),
                //     child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed(AppRoutes.photoImageView,
                //             parameters: {"imgUel": msgContent.content});
                //       },
                //       child: CachedNetworkImage(
                //         imageUrl: msgContent.content,
                //         errorWidget: (context, url, error) {
                //           return const Icon(
                //             Icons.error_outline,
                //           );
                //         },
                //         imageBuilder: (context, imageProvider) {
                //           return Container(
                //             // height: 44,
                //             // width: 44,
                //             margin: null,
                //             padding: null,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(8),
                //               image: DecorationImage(
                //                 image: imageProvider,
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
          ),
        ),
      ],
    ),
  );
}
