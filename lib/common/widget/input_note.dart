import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../utils/app_style.dart';

class InputNote extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const InputNote(
      {super.key,
      required this.controller,
      this.hintText = AppString.text_add_note_here,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus?.context;
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => Scrollable.ensureVisible(
              focusedCtx??context,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            ));
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyle.normal_text
              .copyWith(color: AppColor.solidGray, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.solidGray),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.solidGray))),
      maxLines: 4,
      minLines: 4,
    );
  }
}
