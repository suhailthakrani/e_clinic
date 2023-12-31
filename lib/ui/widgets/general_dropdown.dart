import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dropdown_controller.dart';

class GeneralDropdown extends StatelessWidget {
  final DropdownController controller;
  final double paddingHorizontal;
  final double paddingVertical;
  final void Function(dynamic)? onItemChanged;
  bool _withShadow = false;
  String? hint;

  GeneralDropdown.withBorder({
    super.key,
    required this.controller,
    this.paddingHorizontal = 0,
    this.paddingVertical = 10,
    this.onItemChanged,
    this.hint,
  });

  GeneralDropdown.withShadow({
    super.key,
    required this.controller,
    this.paddingHorizontal = 4,
    this.paddingVertical = 10,
    this.onItemChanged,
    this.hint,
  }) {
    _withShadow = true;
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
            controller.title,
            style: const TextStyle(color: kTextColor, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: _withShadow ? null : Border.all(color: kFieldBorderColor),
              color: _withShadow ? kWhiteColor : kFieldGreyColor,
              boxShadow: _withShadow
                  ? [
                      const BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: kFieldShadowColor)
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(
                  () => DropdownButton(
                    value: controller.selectedItem.value,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(color: Colors.white),
                    icon: Icon(Icons.arrow_drop_down,
                        size: 40,
                        color: controller.items.isEmpty
                            ? kLightGreyColor
                            : kTextColor),
                    iconEnabledColor: Colors.black,
                    items:
                        controller.items.map<DropdownMenuItem>((selectedItem) {
                      return DropdownMenuItem(
                        value: selectedItem,
                        child: Text(
                          selectedItem.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      hint ?? 'Select ${controller.title}',
                      style: const TextStyle(
                          color: kTextHintColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (selectedItem) {
                      controller.selectedItem.value = selectedItem;
                      controller.validate();
                      if (onItemChanged != null) {
                        onItemChanged!(selectedItem);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Visibility(
                visible: controller.errorMessage.value.isNotEmpty,
                child: Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: kRequiredRedColor),
                ),
              )),
        ],
      ),
    );
  }
}
