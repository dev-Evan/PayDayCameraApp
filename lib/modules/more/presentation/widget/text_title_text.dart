import 'package:flutter/cupertino.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

Widget textFieldTitleText({titleText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 2.0),
    child: Text(
      titleText,
      style: AppStyle.small_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeDefault+2 ),
    ),
  );
}