import 'package:flutter/material.dart';

import '../../utils/app_style.dart';


class InputNote extends StatelessWidget {

  final TextEditingController controller;

  const InputNote({super.key, required this.controller});

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
}
