import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppLayout.getSize(context).height-AppLayout.getHeight(150),
        color: Colors.white,
        child: Center(child: SizedBox(height: AppLayout.getHeight(40),width: AppLayout.getWidth(40),child: const CircularProgressIndicator(
          color: AppColor.primary_blue,
        ),)),
      ),
    );
  }
}
