import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/presentation/controller/notication_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../utils/app_string.dart';

class CustomAppbar extends GetView<NotificationController>
    implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          scrolledUnderElevation: .5,
          leadingWidth: AppLayout.getWidth(140),
          toolbarHeight: AppLayout.getHeight(40),
          backgroundColor: AppColor.cardColor,
          leading: Padding(
            padding:  EdgeInsets.only(left: 12.0,bottom: AppLayout.getHeight(8)),
            child: logoView(height: 20, width: 20),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
                  onPressed: () async {
                    Get.toNamed(AppString.notification_screen);
                  },
                  icon: Icon(
                    Icons.notifications_none,
                    color: AppColor.primaryColor,
                    size: Dimensions.fontSizeExtraLarge + 6,
                  ),
                ),
                if (controller.length > 0)
                  Positioned(
                      left: AppLayout.getWidth(25),
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: AppLayout.getHeight(10),
                      ))
              ],
            )
          ],
          elevation: .5,
        ));
  }

  @override
  Size get preferredSize => Size(double.maxFinite, AppLayout.getHeight(43));
}

Widget logoView({double? height = 35, double? width = 35, String? url}) {
  return SvgPicture.asset(
    url ?? Images.logo,
    width: AppLayout.getWidth(width!),
    height: AppLayout.getHeight(height!),
  );
}
