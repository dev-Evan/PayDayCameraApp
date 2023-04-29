import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import 'app_color.dart';

class Util {
  Util._();

  static Color getBtnBgColor(String behaviour, bool isColorWhite) {
    if (behaviour.startsWith("late")) {
      return AppColor.errorColor;
    } else if (behaviour.startsWith("regular")) {
      return isColorWhite
          ? Colors.white
          : AppColor.primary_green.withOpacity(.15);
    } else {
      return AppColor.primary_orange;
    }
  }

  static Color getBtnTextColor(String behaviour) {
    if (behaviour.startsWith("late")) {
      return Colors.white;
    } else if (behaviour.startsWith("regular")) {
      return AppColor.primary_green;
    } else {
      return Colors.white;
    }
  }

  static Color getChipBgColor(String status) {
    if (status.startsWith("status_pending")) {
      return AppColor.pendingBgColor.withOpacity(.15);
    } else {
      return AppColor.errorColor.withOpacity(.15);
    }
  }

  static Color getChipTextColor(String status) {
    if (status.startsWith("status_pending")) {
      return AppColor.pendingBgColor;
    } else {
      return AppColor.errorColor;
    }
  }

  static String getChipText(String status) {
    if (status.startsWith("status_pending")) {
      return AppString.text_pending;
    } else if (status.startsWith("status_reject")) {
      return AppString.text_rejected;
    }
    return "";
  }
}
