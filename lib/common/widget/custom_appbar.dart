import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/presentation/controller/notication_controller.dart';
import 'package:pay_day_mobile/modules/notification/presentation/view/notifications.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/images.dart';

class CustomAppbar extends GetView<NotificationController>
    implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          leadingWidth: AppLayout.getWidth(140),
          toolbarHeight: AppLayout.getHeight(50),
          backgroundColor: AppColor.cardColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: logoView(height: 30, width: 30),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    _openBottomSheet(context);
                    await controller.getAllNotification();
                  },
                  icon: const Icon(
                    Icons.notifications_none,
                    color: AppColor.primaryColor,
                    size: 30,
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
          elevation: 0,
        ));
  }

  Future? _openBottomSheet(BuildContext context) {
    return Get.to(() => Notifications());
  }

  @override
  Size get preferredSize => Size(double.maxFinite, AppLayout.getHeight(52));
}

Widget logoView({double? height = 35, double? width = 35, String? url}) {
  return SvgPicture.asset(
    url ?? Images.logo,
    width: AppLayout.getWidth(width!),
    height: AppLayout.getHeight(height!),
  );
}
