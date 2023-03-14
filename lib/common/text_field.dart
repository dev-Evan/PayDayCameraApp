import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class CustomTextFeild extends StatefulWidget {
  String hintText;
  final inputType;
  final controller;

  CustomTextFeild({
    required this.hintText,
    this.inputType,
    this.controller,
  });

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextField(
          keyboardType: widget.inputType,
          controller: widget.controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: widget.hintText,
              focusColor: AppColor.primaryColor,
              hintStyle: GoogleFonts.poppins(color: AppColor.hintColor),
              filled: false,
              fillColor: AppColor.backgroundColor,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.0, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.disableColor, width: 0.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.0, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              )),
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  String hintText;
  final inputType;
  final controller;

  CustomPasswordTextField(
      {required this.hintText, this.inputType, this.controller});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: value,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.hintText,
            focusColor: AppColor.primaryColor,
            hintStyle: GoogleFonts.poppins(color: AppColor.hintColor),
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
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.disableColor, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.0, color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            )),
      ),
    );
  }
}
