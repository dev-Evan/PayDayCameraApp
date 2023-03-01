// import 'package:flutter/material.dart';
// import 'package:pay_day_mobile/utils/app_color.dart';
// import 'package:pay_day_mobile/utils/images.dart';
//
// import '../utils/app_layout.dart';
//
// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppbar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//
//       title: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image.asset(Images.app_logo),
//           const Icon(Icons.notifications_none,color: AppColor.primary_blue,)
//         ],
//       ),
//       elevation: 0,
//     );
//   }
//
//   @override
//   Size get preferredSize => Size(double.maxFinite, AppLayout.getHeight(60));
// }


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../utils/app_layout.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: AppLayout.getWidth(150),
      toolbarHeight: AppLayout.getHeight(35),
      leading:Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset(Images.app_logo,fit: BoxFit.cover,),
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.bell,

          ),
        )
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, AppLayout.getHeight(60));
}
