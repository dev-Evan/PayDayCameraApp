import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../utils/images.dart';
import '../controller/notication_controller.dart';

class Notifications extends GetView<NotificationController> {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _notificationAppbar(),
      body: controller.obx(
          (state) => SafeArea(
                child: ListView(
                  controller: controller.scrollController,
                  children: [
                    controller.allNotifications.isEmpty
                        ? SizedBox(
                            height: AppLayout.getSize(context).height -
                                Get.statusBarHeight,
                            child: Center(
                              child: svgIcon(
                                  url: Images.no_data_found,
                                  width: 150,
                                  height: 150),
                            ),
                          )
                        : _contentLayout(),
                  ],
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }

  _contentLayout() => RefreshIndicator(
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
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
                  ? const SizedBox(height: 70, child: LoadingIndicator())
                  : Container())
            ],
          ),
        ),
      );

  _notificationCard(int index) {
    String _plainText = htmlParser
            .parse(controller.allNotifications[index].title ?? "")
            .documentElement
            ?.text ??
        "";

    return Container(
      decoration: BoxDecoration(
          color: controller.allNotifications[index].read ?? false
              ? Colors.transparent
              : AppColor.primaryColor.withOpacity(.15),
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade500, width: .5))),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(20),
          horizontal: AppLayout.getWidth(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          _plainText,
          style: AppStyle.normal_text_black,
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
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Text(
        AppString.notification,
        style: AppStyle.title_text.copyWith(color: Colors.black, fontSize: 16),
      ),
      titleSpacing: 0,
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
                AppString.mark_read,
                style: AppStyle.normal_text
                    .copyWith(color: AppColor.primaryBlue, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _refreshPage() async {
    controller.getAllNotification();
  }
}
