import '/../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  double? titleFontSize;
  Widget? leading;

  CustomTile({
    required this.title,
    this.icon = const Icon(Icons.arrow_forward_ios),
    required this.onTap,
    this.titleFontSize,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        // dense: true,
        // contentPadding: EdgeInsets.zero,
        leading: leading ?? const SizedBox(),
        minLeadingWidth: leading != null ? 30.w : 0,
        tileColor: kWhiteColor,
        titleTextStyle: TextStyle(
          fontSize: titleFontSize ?? 16,
          fontWeight: FontWeight.w500,
          color: kBlackColor,
        ),
        splashColor: kFieldBorderColor,
        title: Text(title),
        onTap: onTap,
        trailing: icon,
      ),
    );
  }
}
