import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../utils/app_style.dart';


class InputNote extends StatelessWidget {

  final TextEditingController controller;
  String hintText;
  final String? Function(String?)? validator;

  InputNote(
      {required this.controller,
       this.hintText =AppString.text_add_note_here, this.validator});  // const InputNote({super.key, required this.controller,required hintText});

  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus!.context;
    Future.delayed(const Duration(milliseconds: 200)).then((value) => Scrollable.ensureVisible(
      focusedCtx!,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    ));
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(
              left: AppLayout.getWidth(16),
              right: AppLayout.getWidth(20),
              top: AppLayout.getHeight(16),
              bottom: AppLayout.getHeight(16)),          hintStyle: AppStyle.normal_text
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
