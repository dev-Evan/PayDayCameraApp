import 'package:flutter/material.dart';
import 'package:pay_day_mobile/enum/status.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'app_color.dart';


String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

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
    } else if (status.toLowerCase() == ApprovalStatus.success.name) {
      return AppColor.primaryGreen.withOpacity(.15);
    } else if (status.toLowerCase() == ApprovalStatus.dark.name) {
      return AppColor.primaryRed.withOpacity(.15);
    } else {
      return Colors.transparent;
    }
  }

  static Color getChipTextColor({required String status}) {
    if (status.toLowerCase() == ApprovalStatus.warning.name) {
      return AppColor.primaryYellow;
    } else if (status.toLowerCase() == ApprovalStatus.success.name) {
      return AppColor.primaryGreen;
    } else if (status.toLowerCase() == ApprovalStatus.danger.name) {
      return AppColor.primaryRed;
    } else if (status.toLowerCase() == ApprovalStatus.dark.name) {
      return AppColor.primaryRed;
    } else {
      return Colors.transparent;
    }
  }

  static String getChipText(String status) {
    if (status.toLowerCase() == ApprovalStatus.warning.name) {
      return AppString.text_pending;
    } else if (status.toLowerCase() == ApprovalStatus.success.name) {
      return AppString.text_success;
    } else if (status.toLowerCase() == ApprovalStatus.danger.name) {
      return AppString.text_rejected;
    } else if (status.toLowerCase() == ApprovalStatus.dark.name) {
      return AppString.text_rejected;
    }
    return "";
  }
}
Future<void> futureDelayed({required onAction}) {
  return Future.delayed(const Duration(seconds: 1), () => onAction());
}

