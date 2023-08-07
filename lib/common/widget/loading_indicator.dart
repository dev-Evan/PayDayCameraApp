import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/images.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppLayout.getSize(context).height,
        color: Colors.white,
        child: Platform.isIOS ? _ios():_android() ,
      ),
    );
  }


}

bottomSheetLoader() {
  return Center(
    child: Container(
      height: Get.height * .8,
      color: Colors.white,
      child: Platform.isIOS
      ? _ios()
      :  _android(),
    ),
  );
}

loadingIndicatorLayout({double height = 100}) {
  return SizedBox(
    height: AppLayout.getHeight(height),
    child: Center(
      child: Lottie.asset(Images.loading,
        height: height,),
    ),
  );
}


_android() {
  return Center(
      child: SizedBox(
        height: AppLayout.getHeight(150),
        width: AppLayout.getWidth(150),
        child: Lottie.asset(Images.loading),
      ));
}

_ios() {
  return Center(
      child: SizedBox(
          height: AppLayout.getHeight(60),
          width: AppLayout.getWidth(60),
          child: const CupertinoActivityIndicator(
            color: AppColor.primaryBlue,
          )));
}