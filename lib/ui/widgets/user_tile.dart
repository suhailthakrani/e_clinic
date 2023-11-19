import 'package:e_clinic/ui/widgets/widget_svg.dart';

import '/../controllers/forgot_password_controller.dart';
import '/../utils/colors.dart';
import '/../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserTile extends StatefulWidget {
  const UserTile({
    Key? key,
    required this.image,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  final String image;
  final String title;
  final bool isSelected;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, w) => Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Container(
          alignment: Alignment.center,
          height: 120.h,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isSelected ? kPrimaryColor : Colors.grey.shade300,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            // splashColor: const Color.fromARGB(248, 157, 162, 197),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  // borderRadius: B,
                  child: widget.image.contains('.png')
                      ? Image.asset(
                          widget.image,
                          height: 70,
                          width: 70,
                        )
                      : WSvgWidget(
                          imageUrl: widget.image,
                          height: 70,
                          width: 70,
                        ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54,),
                      ),
                    ],
                  ),
                ),
                if (widget.isSelected)
                  WSvgWidget(
                    imageUrl: 'assets/images/checkbox.svg',
                    height: 30,
                    width: 30,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
