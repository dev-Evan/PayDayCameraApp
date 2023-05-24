import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../utils/app_style.dart';


class InputNote extends StatelessWidget {

  final TextEditingController controller;
  String hintText;

  InputNote(
      {required this.controller,
       this.hintText =AppString.text_add_note_here});  // const InputNote({super.key, required this.controller,required hintText});

  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus!.context;
    Future.delayed(const Duration(milliseconds: 200)).then((value) => Scrollable.ensureVisible(
      focusedCtx!,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    ));
    return TextField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyle.normal_text
              .copyWith(color: AppColor.solidGray, fontWeight: FontWeight.w400),
          isDense: true,
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),

          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.solidGray),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),

          border: const OutlineInputBorder(
              borderSide: BorderSide(color:AppColor.solidGray))),
      maxLines: 5,
      minLines: 3,
    );
  }
}
