import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppLayout.getSize(context).height,
        color: Colors.white,
        child: Center(
            child: SizedBox(
          height: AppLayout.getHeight(50),
          width: AppLayout.getWidth(50),
          child: Platform.isIOS
              ? const CupertinoActivityIndicator(
                  color: AppColor.primaryBlue,
                )
              : const CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
        )),
      ),
    );
  }
}

bottomSheetLoader(){
  return Center(
    child: Container(
      height: Get.height*.8,
      color: Colors.white,
      child: Center(
          child: SizedBox(
            height: AppLayout.getHeight(50),
            width: AppLayout.getWidth(50),
            child: Platform.isIOS
                ? const CupertinoActivityIndicator(
              color: AppColor.primaryBlue,
            )
                : const CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          )),
    ),
  );
}

 loadingIndicatorLayout() {
  return SizedBox(
    height: AppLayout.getHeight(50),
    child: const LoadingIndicator(),
  );
}

