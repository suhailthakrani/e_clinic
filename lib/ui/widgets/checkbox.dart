import 'package:flutter/material.dart';

import '../../utils/text_styles.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
        ),
        Expanded(
          child: Text(
            widget.text,
            style: textTheme.bodyMedium,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
