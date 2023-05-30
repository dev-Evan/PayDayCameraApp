import 'package:flutter/material.dart';
import 'package:pay_day_mobile/enum/status.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import 'app_color.dart';

class Util {
  Util._();

  static Color getBtnBgColor(
      {required String behaviour, required bool isBgColorWhite}) {
    if (!isBgColorWhite) {
      if (behaviour.toLowerCase() == EntryBehaviour.early.name) {
        return AppColor.primaryOrange;
      } else if (behaviour.toLowerCase() == EntryBehaviour.regular.name) {
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
      if (behaviour.toLowerCase() == EntryBehaviour.early.name) {
        return AppColor.primaryOrange;
      } else if (behaviour.toLowerCase() == EntryBehaviour.regular.name) {
        return AppColor.primaryGreen;
      } else {
        return AppColor.primaryRed;
      }
    }

    return Colors.white;
  }

  static Color getChipBgColor({required String status}) {
    if (status.toLowerCase() == ApprovalStatus.warning.name) {
      return AppColor.primaryYellow.withOpacity(.15);
    } else if (status.toLowerCase() == ApprovalStatus.danger.name) {
      return AppColor.primaryRed.withOpacity(.15);
    } else {
      return AppColor.primaryRed.withOpacity(.15);
    }
  }

  static Color getChipTextColor({required String status}) {
    if (status.toLowerCase() == "secondary") {
      return AppColor.primaryYellow;
    } else if (status.toLowerCase() == ApprovalStatus.danger.name) {
      return AppColor.primaryRed;
    } else {
      return AppColor.primaryRed;
    }
  }

  static String getChipText(String status) {
    if (status.toLowerCase() == ApprovalStatus.warning.name) {
      return AppString.text_pending;
    } else if (status.toLowerCase() == ApprovalStatus.danger.name) {
      return AppString.text_rejected;
    }
    return "";
  }
}
