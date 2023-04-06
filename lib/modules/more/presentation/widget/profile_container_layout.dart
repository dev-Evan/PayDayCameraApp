import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/user_status.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../utils/images.dart';


Widget profileCardLayOut({context, userName,final userImage, userEmail,statusText}) {


  return Expanded(
      flex: 3,
      child: Container(
        decoration: AppStyle.ContainerStyle.copyWith(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radiusMid + 4),
                bottomRight: Radius.circular(Dimensions.radiusMid + 4))),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:userImage ,
                        radius: 28,
                      ),

                      
                      SizedBox(
                        width: AppLayout.getWidth(16),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: AppStyle.mid_large_text
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            userEmail,
                            style: AppStyle.normal_text.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions.fontSizeDefault - 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                  userStatusView(statusText: statusText)
                ],
              ),
              const Spacer(),
              _moveProfileView(
                  onAction: () => CustomNavigator(
                      context: context, pageName: ViewProfile())),
            ],
          ),
        ),
      ));
}

Widget _moveProfileView({onAction}) {
  return Center(
    child: InkWell(
      onTap: () => onAction(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppString.text_view_profile,
            style: AppStyle.small_text
                .copyWith(fontSize: Dimensions.fontSizeDefault),
          ),
          SizedBox(
            width: AppLayout.getWidth(8),
          ),
          Icon(
            Icons.arrow_forward,
            color: AppColor.cardColor,
            size: Dimensions.fontSizeDefault + 3,
          )
        ],
      ),
    ),
  );
}

