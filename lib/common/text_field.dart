import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFeild extends StatefulWidget {
  String hintText;
  final inputType;
  final controller;

  CustomTextFeild(this.hintText, this.inputType, this.controller);

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextField(
          keyboardType: widget.inputType,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(color: AppColor.hintColor),
              filled: false,
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.disableColor, width: 0.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 0.0, color: AppColor.primaryColor),
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

  CustomPasswordTextField(this.hintText, this.inputType, this.controller);

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
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(color: AppColor.hintColor),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    value = !value;
                  });
                },
                icon: value
                    ? FaIcon(
                        FontAwesomeIcons.eyeSlash,
                        size: 15,
                        color: Colors.grey,
                      )
                    : FaIcon(FontAwesomeIcons.eye,
                        size: 15, color: Colors.grey)),
            filled: false,
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.disableColor, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.0, color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            )),
      ),
    );
  }
}
