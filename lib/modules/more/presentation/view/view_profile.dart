import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/change_password.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class ViewProfile extends StatelessWidget {
  //UserProfileController profileData=Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileViewAppbar(
                titleText: AppString.text_my_profile,
                rightBtnAction: () => CustomNavigator(
                    context: context, pageName: const EditProfile())),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            _circleAvatarStyle(onAction: () {}, userImage: Images.user),

            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '',
                    style: AppStyle.mid_large_text.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColor.normalTextColor),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'hdfh',
                          style: AppStyle.small_text
                              .copyWith(color: AppColor.hintColor),
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(8),
                        ),
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColor.hintColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(8),
                    ),
                    Text(
                      'hdf',
                      style: AppStyle.small_text
                          .copyWith(color: AppColor.hintColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                _moveChangePassword(
                    context: context,
                    onAction: () => CustomNavigator(
                        context: context, pageName: ChangePassword())),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_about_me),
                      SizedBox(
                        height: AppLayout.getHeight(8),
                      ),
                      Text(
                        AppString.text_about_me_dec,
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault - 1),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(14),
                      ),
                      textFieldTitleText(titleText: AppString.text_general),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_department,
                          icon: Icons.work_outline_outlined),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_shift,
                          icon: Icons.access_time_outlined),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_email,
                          icon: CupertinoIcons.mail),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_phone,
                          icon: CupertinoIcons.phone),
                      SizedBox(
                        height: AppLayout.getHeight(14),
                      ),
                      textFieldTitleText(titleText: AppString.text_personal),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_address,
                          icon: CupertinoIcons.home),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_birthday,
                          icon: Icons.card_giftcard),
                      _cardView(
                          dynamicText: 'dynamic',
                          titleText: AppString.text_gender,
                          icon: CupertinoIcons.person),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cardView({icon, dynamicText, titleText}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      children: [
        _cardIconView(cardIcon: icon),
        SizedBox(
          width: AppLayout.getWidth(8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dynamicText,
              style: AppStyle.small_text_black.copyWith(
                  fontSize: Dimensions.fontSizeSmall + 2,
                  color: AppColor.normalTextColor),
            ),
            Text(
              titleText,
              style: AppStyle.small_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault - 2,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _circleAvatarStyle({userImage, onAction}) {
  return Stack(
    children: [
      CircleAvatar(
        radius: 34,
        backgroundColor: AppColor.primaryColor,
        child: CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(userImage),
        ),
      ),
      Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColor.primaryColor,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => onAction(),
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 14,
                  ))))
    ],
  );
}

Widget _cardIconView({cardIcon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Icon(
            cardIcon,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}

Widget _moveChangePassword({
  context,
  onAction,
}) {
  return InkWell(
    onTap: () => onAction(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            AppString.text_change_password,
            style: AppStyle.small_text.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeDefault),
          ),
        ),
        SizedBox(
          width: AppLayout.getWidth(4),
        ),
        const Icon(
          Icons.arrow_forward,
          color: AppColor.primaryColor,
          size: 16,
        )
      ],
    ),
  );
}
