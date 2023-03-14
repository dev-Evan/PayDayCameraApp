import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/change_password.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../widget/documents_appbar.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileViewAppbar(
                titleText: AppString.text_documents, rightBtnAction: ()=>CustomNavigator(context: context,pageName: const EditProfile())),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: AppColor.primaryColor,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(Images.user),
                  ),
                ),
                const Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 14,
                        )))
              ],
            ),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    AppString.text_user_name,
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
                          AppString.text_ux_deginer,
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
                      AppString.text_permanent,
                      style: AppStyle.small_text
                          .copyWith(color: AppColor.hintColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                InkWell(
                  onTap: () => CustomNavigator(
                      context: context, pageName:  ChangePassword()),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.text_about_me,
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeDefault + 1),
                      ),
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
                      Text(
                        AppString.text_general,
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeDefault + 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.work_outline_outlined,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_laravel,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_department,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.access_time_outlined,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_regular,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_shift,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.mail,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_user_email,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_email,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.phone,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_phone_number,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_department,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(14),
                      ),
                      Text(
                        AppString.text_personal,
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeDefault + 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_ca_usa,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_address,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.card_giftcard,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_01_jan_1998,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_birthday,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                                elevation: 0,
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.person,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: AppLayout.getWidth(8),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.text_male,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                ),
                                Text(
                                  AppString.text_gender,
                                  style: AppStyle.small_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault - 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
