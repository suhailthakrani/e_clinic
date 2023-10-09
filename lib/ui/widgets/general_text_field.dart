import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/text_field_manager.dart';

class GeneralTextField extends StatelessWidget {
  final TextFieldManager tfManager;
  final IconData? suffixIcon;
  final int maxLines;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool readOnly;
  final RxBool _withShadow = RxBool(false);

  GeneralTextField.withBorder(
      {Key? key,
      required this.tfManager,
      this.suffixIcon,
      this.maxLines = 1,
      this.paddingHorizontal = 20,
      this.paddingVertical = 10,
      this.readOnly = false})
      : super(key: key);

  GeneralTextField.withShadow(
      {Key? key,
      required this.tfManager,
      this.suffixIcon,
      this.maxLines = 1,
      this.paddingHorizontal = 4,
      this.paddingVertical = 10,
      this.readOnly = false})
      : super(key: key) {
    _withShadow.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tfManager.fieldName,
            style: const TextStyle(color: kBlackColor, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Obx(
            () => Container(
              width: Get.width,
              padding: const EdgeInsets.only(left: 8, right: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: _withShadow.isTrue
                      ? null
                      : Border.all(
                          color: tfManager.errorMessage.isEmpty
                              ? kFieldBorderColor
                              : kRequiredRedColor),
                  color: readOnly
                      ? kFieldGreyColor
                      : _withShadow.isTrue
                          ? kWhiteColor
                          : kFieldGreyColor,
                  boxShadow: _withShadow.isTrue
                      ? [
                          const BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: kFieldShadowColor)
                        ]
                      : null),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: tfManager.keyboardType,
                        maxLines: maxLines,
                        minLines: maxLines > 2 ? 3 : null,
                        readOnly: readOnly,
                        maxLength: tfManager.length,
                        controller: tfManager.controller,
                        focusNode: tfManager.focusNode,
                        textCapitalization: tfManager.textCapitalization,
                        onChanged: (value) {
                          tfManager.validate();
                        },
                        textInputAction: maxLines == 1
                            ? TextInputAction.done
                            : TextInputAction.newline,
                        inputFormatters: tfManager.formatters,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: tfManager.hint ?? tfManager.fieldName,
                          contentPadding: const EdgeInsets.all(2),
                          border: InputBorder.none,
                          hintStyle: const TextStyle(color: kTextHintColor),
                        ),
                        style: TextStyle(
                            color: readOnly ? kGreyColor : kBlackColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4, vertical: maxLines == 1 ? 11 : 6),
                      child: suffixIcon != null &&
                              tfManager.errorMessage.isEmpty
                          ? Icon(suffixIcon, color: kTextHintColor)
                          : tfManager.errorMessage.isNotEmpty &&
                                  _withShadow.isFalse
                              ? const Icon(Icons.info, color: kRequiredRedColor)
                              : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Visibility(
                visible: tfManager.errorMessage.value.isNotEmpty,
                child: Text(
                  tfManager.errorMessage.value,
                  style: const TextStyle(color: kRequiredRedColor),
                ),
              )),
        ],
      ),
    );
  }
}
