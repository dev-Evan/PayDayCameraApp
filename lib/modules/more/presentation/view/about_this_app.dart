import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_spacer.dart';

class AboutThisApp extends StatelessWidget {
  const AboutThisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: _body(),
    );
  }
}

Widget _body(){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Center(child: svgIcon(url: Images.favIcon,width: 68,height: 68)),
        customSpacerHeight(height: 26),

        Text(
          AppString.text_version_2_1_0_1,
          style: AppStyle.title_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeMid),
        ),

        customSpacerHeight(height: 4),
        Text(
          AppString.text_last_update_may_2023,
          style:
          AppStyle.small_text_black.copyWith(color: AppColor.hintColor),
        ),
        const Spacer(),
        CustomButton(AppString.text_back, () => Get.back()),
      ],
    ),
  );
}