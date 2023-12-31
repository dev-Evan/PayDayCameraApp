import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/pick_image_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/user_status.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/view_profile_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../../../../common/widget/custom_spacer.dart';
import '../controller/user_profile_controller.dart';
import '../view/view_profile.dart';

Widget profileCardLayOut({required context,required userName, required final userImage,required userEmail,required statusText}) {
  return Expanded(
      flex: 2,
      child: Container(
        decoration: AppStyle.ContainerStyle.copyWith(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radiusMid + 4),
                bottomRight: Radius.circular(Dimensions.radiusMid + 4))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppLayout.getHeight(54),
                    width: AppLayout.getWidth(54),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: ClipOval(
                      child: FadeInImage(
                        image: NetworkImage(userImage),
                        placeholder: Get.find<PickImageController>()
                                    .pickedImage
                                    .value ==
                                null
                            ? placeholderImages
                            : Image.file(File(Get.find<PickImageController>()
                                    .pickedImage
                                    .value!
                                    .path))
                                .image,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.transparent,
                            backgroundImage: Get.find<PickImageController>()
                                        .pickedImage
                                        .value ==
                                    null
                                ? placeholderImages
                                : Image.file(File(
                                        Get.find<PickImageController>()
                                            .pickedImage
                                            .value!
                                            .path))
                                    .image,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  customSpacerWidth(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _userNameText(userName: userName),
                        customSpacerHeight(height: 2),
                        _userEmail(userEmail: userEmail)
                      ],
                    ),
                  ),
                  userStatusView(statusText: statusText)
                ],
              ),
              const Spacer(),
              customSpacerHeight(height: 12),
              _moveProfileView(onAction: () async {
                defaultNavigator(context: context,routeName: const ViewProfile());
                await Get.find<ProfileDataController>().getProfileData();
              }),
              customSpacerHeight(height: 8),
            ],
          ),
        ),
      ));
}



Widget _userNameText({required userName}) {
  GetStorage().write(AppString.USER_NAME, userName.toString());
  return Text(
    userName,
    style: AppStyle.mid_large_text
        .copyWith(fontWeight: FontWeight.w800, letterSpacing: 0.2),
  );
}

Widget _userEmail({required userEmail}) {
  return Text(
    userEmail,
    style: AppStyle.normal_text.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.fontSizeDefault - 1,
        letterSpacing: 0.2),
  );
}

Widget _moveProfileView({onAction}) {
  return Center(
    child: InkWell(
      onTap: () => onAction(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _viewProfileText(),
          customSpacerWidth(width: 8),
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

Widget _viewProfileText() {
  return Text(
    AppString.text_view_profile,
    style: AppStyle.small_text.copyWith(fontSize: Dimensions.fontSizeDefault),
  );
}

Future navigatorForViewProfile({context}) {
  return  defaultOffNavigator(routeName: const ViewProfile(),context: context);

}
