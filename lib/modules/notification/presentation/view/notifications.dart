import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../controller/notication_controller.dart';

class Notifications extends GetView<NotificationController> {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
              body: ListView(
                controller: controller.scrollController,
                children: [
                  _notificationAppbar(),
                  _contentLayout(),
                ],
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _contentLayout() => Column(
        children: [
          Obx(() => ListView.builder(
                itemCount: controller.allNotifications.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => controller.notificationAsRead(
                      controller.notifications.data?.data?[index].id ?? ""),
                  child: _notificationCard(index),
                ),
              )),
          Obx(() => controller.isMoreDataLoading.isTrue
              ? Center(
                  child: const CircularProgressIndicator(),
                )
              : Container())
        ],
      );

  _notificationCard(int index) {
    return Container(
      decoration: BoxDecoration(
          color: controller.allNotifications[index].read ?? false
              ? Colors.transparent
              : AppColor.primary_blue.withOpacity(.15),
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade500, width: .5))),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(20),
          horizontal: AppLayout.getWidth(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HtmlWidget(
          controller.allNotifications[index].title ?? "",
          textStyle: AppStyle.normal_text_black,
        ),
        customSpacerHeight(height: 4),
        Text(
          "${controller.allNotifications[index].date ?? ""} ${controller.allNotifications[index].time ?? ""}",
          style: AppStyle.normal_text_grey,
        ),
      ]),
    );
  }

  _notificationAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: .5,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        AppString.notification,
        style: AppStyle.title_text.copyWith(color: Colors.black, fontSize: 16),
      ),
      actions: [
        InkWell(
          onTap: () => controller.notificationAaALLRead(),
          child: Padding(
            padding: EdgeInsets.only(
                top: AppLayout.getHeight(2),
                right: AppLayout.getWidth(20),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                controller.notifications.data != null &&
                    controller.notifications.data!.data!.length > 0
                    ? AppString.mark_read
                    : "",
                style: AppStyle.normal_text
                    .copyWith(color: AppColor.primary_blue,fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
