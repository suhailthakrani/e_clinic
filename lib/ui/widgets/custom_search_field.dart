import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final double height;
  final String hint;
  final FocusNode focusNode;
  
  final Function() onTap;

  const CustomSearchField({
    Key? key,
    required this.controller,
    required this.height,
    required this.hint,
    required this.focusNode, required this.onTap,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: 16),
      child: CupertinoTextField(
      focusNode: focusNode,
        controller: controller,
        placeholder: hint,
        placeholderStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: kGreyColor,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border.all(
            color: kFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.only(left: 12),
        suffix: GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
