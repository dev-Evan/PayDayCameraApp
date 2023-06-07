import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class CustomTextFeild extends StatelessWidget {
  final String hintText;
  final inputType;
  final controller;
  final String? Function(String?)? validator;
  CustomTextFeild({
    Key? key,
    required this.hintText,
    this.validator,
    this.inputType,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus!.context;
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => Scrollable.ensureVisible(
              focusedCtx!,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            ));

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: TextFormField(
        keyboardType: inputType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: AppLayout.getWidth(16),
              right: AppLayout.getWidth(20),
              top: AppLayout.getHeight(16),
              bottom: AppLayout.getHeight(16)),
          hintText: hintText,
          focusColor: AppColor.primaryColor,
          hintStyle: GoogleFonts.poppins(
              color: AppColor.hintColor,
              fontSize: Dimensions.fontSizeDefault + 1),
          filled: false,
          fillColor: AppColor.backgroundColor,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.solidGray),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final String hintText;
  final inputType;
  final controller;
  final String? Function(String?)? validator;

  CustomPasswordTextField({
    Key? key,
    required this.hintText,
    this.validator,
    this.inputType,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomPasswordTextField> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomPasswordTextField> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus!.context;
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => Scrollable.ensureVisible(
      focusedCtx!,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    ));

    return TextFormField(
      controller: widget.controller,
      obscureText: value,
      validator: widget.validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: AppLayout.getWidth(16),
              right: AppLayout.getWidth(16),
              top: AppLayout.getHeight(17),
              bottom: AppLayout.getHeight(17)),
          hintText: widget.hintText,
          focusColor: AppColor.primaryColor,
          hintStyle: GoogleFonts.poppins(
              color: AppColor.hintColor,
              fontSize: Dimensions.fontSizeDefault + 1),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  value = !value;
                });
              },
              icon: value
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      size: 20,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20,
                      color: Colors.grey,
                    )),
          filled: false,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.solidGray),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          )),
    );
  }
}
