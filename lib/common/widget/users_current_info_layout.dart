import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';

class UsersCurrentInfoLayout extends StatelessWidget {
  final String title;
  final String data;

  const UsersCurrentInfoLayout({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(4),
              vertical: AppLayout.getHeight(4)),
          child: title == AppString.text_my_location
              ? const Icon(
                  Icons.my_location,
                  color: Colors.blueAccent,
                )
              : const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blueAccent,
                ),
        ),
        SizedBox(
          width: AppLayout.getWidth(8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data,
              style: AppStyle.normal_text_black
                  .copyWith(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              title,
              style: AppStyle.small_text
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
