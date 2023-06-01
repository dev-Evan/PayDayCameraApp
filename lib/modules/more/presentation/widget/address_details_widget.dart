import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../common/widget/custom_spacer.dart';

Widget textTitle({titleText}) {
  return Text(
    titleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.hintColor.withOpacity(0.9),
        fontSize: Dimensions.fontSizeDefault-1,
        fontWeight: FontWeight.w200),
  );
}
Widget textSubTitle({subTitleText}) {
  return Text(
    subTitleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeDefault + 1,
        fontWeight: FontWeight.w500),
  );
}
Widget addButton({onAction}) {
  return Row(
    children: [
      TextButton(
          onPressed: () => onAction(),
          child: Text(
            AppString.text_add,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeDefault),
          )),
      Icon(
        Icons.add,
        color: AppColor.primaryColor,
        size: Dimensions.fontSizeDefault + 8,
      )
    ],
  );
}

Widget editDetBtn({ required context, onAction, required editAction}) {
  return Row(
    children: [
      InkWell(
          onTap: () => customButtomSheet(context: context, height: 0.9, child: editAction),

          child: editIcon()),
      customSpacerWidth(width: 28),
      InkWell(
        onTap: () => onAction(),
        child: const Icon(
          CupertinoIcons.delete,
          color: AppColor.hintColor,
          size: 20,
        ),
      ),
    ],
  );
}

Widget editIcon() {
  return SizedBox(
      height: AppLayout.getHeight(20),
      width: AppLayout.getWidth(20),
      child: Image(image: AssetImage(Images.edit)));
}

Widget perTitleText() {
  return Text(
    "${AppString.text_permanent}${AppString.text_address}",
    style: AppStyle.mid_large_text
        .copyWith(color: AppColor.normalTextColor, fontWeight: FontWeight.bold),
  );
}

Widget currTitleText() {
  return Text(
    AppString.text_current_address,
    style: AppStyle.mid_large_text
        .copyWith(color: AppColor.normalTextColor, fontWeight: FontWeight.bold),
  );
}
