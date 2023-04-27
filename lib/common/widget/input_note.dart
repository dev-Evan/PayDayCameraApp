import 'package:flutter/material.dart';

import '../../utils/app_style.dart';

Widget inputNote({TextEditingController? controller}) {
  return TextField(
    keyboardType: TextInputType.multiline,
    controller: controller,
    decoration: InputDecoration(
        hintText: "Add Note Here",
        hintStyle: AppStyle.normal_text
            .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
        isDense: true,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey))),
    maxLines: 5,
    minLines: 3,
  );
}