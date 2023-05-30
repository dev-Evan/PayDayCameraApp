import 'package:flutter/material.dart';
import 'package:pay_day_mobile/enum/status.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import 'app_color.dart';

class Util {
  Util._();


  static Color getBtnBgColor(
      {required String behaviour, required bool isBgColorWhite}) {
    if (!isBgColorWhite) {
      if (behaviour.toLowerCase() == EntryBehaviour.early) {
        return AppColor.primaryOrange;
      } else if (behaviour.toLowerCase() == EntryBehaviour.regular) {
        return AppColor.primaryGreen;
      } else {
        return AppColor.primaryRed;
      }
    }

    return Colors.white;
  }

  static Color getBtnTextColor(
      {required String behaviour, required bool isBgColorWhite}) {
    if (isBgColorWhite) {
      if (behaviour.toLowerCase() == EntryBehaviour.early) {
        return AppColor.primaryOrange;
      } else if (behaviour.toLowerCase() == EntryBehaviour.regular) {
        return AppColor.primaryGreen;
      } else {
        return AppColor.primaryRed;
      }
    }

    return Colors.white;
  }

  static Color getChipBgColor(String status) {
    switch (status) {
      case "warning":
        return AppColor.pendingBgColor.withOpacity(.15);
      case "success":
        return AppColor.primaryGreen.withOpacity(.15);
      default:
        return AppColor.errorColor.withOpacity(.15);
    }
  }

  static Color getChipTextColor(String status) {
    switch (status) {
      case "warning":
        return AppColor.pendingBgColor;
      case "success":
        return AppColor.primaryGreen;
      default:
        return AppColor.errorColor;
    }
  }

  static String getChipText(String status) {
    if (status.startsWith("warning")) {
      return AppString.text_pending;
    } else if (status.startsWith("status_reject")) {
      return AppString.text_rejected;
    }
    return "";
  }
}
