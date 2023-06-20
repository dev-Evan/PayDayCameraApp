import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/arrow_style.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/widget/custom_spacer.dart';

Widget jobDeskTitle({required text}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(20)),
    child: Text(
      text,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeDefault + 2),
    ),
  );
}
Widget jobDeskCard({cardIcon, cardText, onAction}) {
  return InkWell(
    onTap: () => onAction(),
    child: Column(
      
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                cardShape(icon: cardIcon),
                customSpacerWidth(width: 12),
                Text(
                  cardText,
                  style: AppStyle.small_text_black.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: AppColor.normalTextColor,fontWeight: FontWeight.w400),
                )
              ],
            ),
            avatarArrowIcon()
          ],
        ),
        customSpacerHeight(height: 4),
        Divider(thickness: 0.5,color: AppColor.disableColor.withOpacity(0.7),),
        customSpacerHeight(height: 4),

      ],
    ),
  );
}

Widget cardShape({icon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:   SvgPicture.asset(
            icon.toString(),
            width: AppLayout.getWidth(20),
            height: AppLayout.getWidth(20),
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}

Widget languageCardView({langText, langName}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      decoration: AppStyle.ContainerStyle.copyWith(
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
        color: AppColor.primaryColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                langName,
                style: AppStyle.small_text_black.copyWith(
                    fontSize: Dimensions.fontSizeSmall + 2,
                    color: AppColor.normalTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Row(
                children: [
                  Text(
                    langText,
                    style: AppStyle.small_text_black.copyWith(
                        fontSize: Dimensions.fontSizeSmall + 2,
                        color: AppColor.normalTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(4),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: AppColor.normalTextColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}