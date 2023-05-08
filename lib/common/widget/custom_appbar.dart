
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/presentation/view/notifications.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/images.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: AppLayout.getWidth(150),
      toolbarHeight: AppLayout.getHeight(35),
      backgroundColor: AppColor.cardColor,

      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset(
          Images.app_logo,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () =>_openBottomSheet(context),
          icon: const Icon(
            Icons.notifications_none,
            color: AppColor.primaryColor,size: 30,
          ),
        )
      ],
      elevation: 0,
    );
  }

  Future _openBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const Notifications(),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, AppLayout.getHeight(60));
}
