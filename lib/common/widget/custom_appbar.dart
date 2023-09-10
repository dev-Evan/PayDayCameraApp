import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/presentation/controller/notication_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../routes/app_pages.dart';

class CustomAppbar extends GetView<NotificationController>
    implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          scrolledUnderElevation: .5,
          leadingWidth: 130,
          toolbarHeight: 46,
          backgroundColor: AppColor.cardColor,
          leading: Padding(
            padding: leadingEdgeInsets,
            child: svgIcon(height: 20, width: 20),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  padding: iconButtonEdgeInsets,
                  onPressed: () async {
                    // Get.toNamed(Routes.NOTIFICATION_SCREEN);

                  },
                  icon: icon,
                ),
                if (controller.length > 0)
                  Positioned(
                      left: AppLayout.getWidth(25),
                      child: circleIcon)
              ],
            )
          ],
          elevation: .5,
        ));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 46);
}

Widget svgIcon(
    {double? height = 35, double? width = 35, String? url, Color? color}) {
  return SvgPicture.asset(
    url ?? Images.logo,
    color: color,
    width: AppLayout.getWidth(width!),
    height: AppLayout.getHeight(height!),
  );
}

EdgeInsets get leadingEdgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(18), bottom: AppLayout.getHeight(8));
}

EdgeInsets get iconButtonEdgeInsets {
  return EdgeInsets.only(bottom: AppLayout.getHeight(8));
}

Icon get icon {
  return Icon(
    Icons.notifications_none,
    color: AppColor.primaryColor,
    size: Dimensions.fontSizeExtraLarge + 6,
  );
}

Icon get circleIcon {
  return Icon(
    Icons.circle,
    color: Colors.red,
    size: AppLayout.getHeight(10),
  );
}