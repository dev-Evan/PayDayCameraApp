import 'package:flutter/material.dart';

import 'app_color.dart';

class Util {
  Util._();

  static Color getBgColor(String behaviour) {
    if (behaviour.startsWith("late")) {
      return AppColor.errorColor;
    } else if (behaviour.startsWith("regular")) {
      return Colors.white;
    } else {
      return AppColor.primary_orange;
    }
  }

  static Color getTextColor(String behaviour) {
    if (behaviour.startsWith("late")) {
      return Colors.white;
    } else if (behaviour.startsWith("regular")) {
      return AppColor.primary_green;
    } else {
      return Colors.white;
    }
  }
}
