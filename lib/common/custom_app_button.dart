import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class AppButton extends StatelessWidget {
  final bool? hasOutline;
  final Color? borderColor;
  final String buttonText;
  final Function onPressed;
  final Color buttonColor;
  final Color? textColor;
  final bool? isButtonExpanded;

  AppButton({
    this.hasOutline = false,
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    this.textColor = Colors.white,
    this.borderColor = Colors.grey,
    this.isButtonExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return isButtonExpanded == true
        ? Expanded(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  side: BorderSide(width: 1, color: borderColor!)),
              onPressed: () async {
                onPressed();
              },
              child: Text(
                buttonText,
                style: textColor != null
                    ? AppStyle.normal_text.copyWith(
                        color: textColor,
                        fontWeight: hasOutline == false
                            ? FontWeight.w600
                            : FontWeight.w400)
                    : AppStyle.normal_text.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
              ),
            ),
          )
        : TextButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                side: BorderSide(width: 1, color: borderColor!)),
            onPressed: () async {
              onPressed();
            },
            child: Text(
              buttonText,
              style: textColor != null
                  ? AppStyle.normal_text.copyWith(
                      color: textColor,
                      fontWeight: hasOutline == false
                          ? FontWeight.w600
                          : FontWeight.w400)
                  : AppStyle.normal_text.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
            ),
          );
  }
}
