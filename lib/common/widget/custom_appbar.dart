import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: AppLayout.getWidth(140),
      toolbarHeight: AppLayout.getHeight(50),
      backgroundColor: AppColor.cardColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: logoView(height: 30,width: 30),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            color: AppColor.primaryColor,
            size: Dimensions.fontSizeExtraLarge + 5,
          ),
        )
      ],
      elevation: 0,
    );
  }
  @override
  Size get preferredSize => Size(double.maxFinite, AppLayout.getHeight(52));
}
Widget logoView({ double? height, double ?width,String? url}) {
  return SvgPicture.asset(
    url ?? Images.logo,
    width: AppLayout.getWidth(width =35),
    height: AppLayout.getHeight(height =35),
  );
}