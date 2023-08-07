import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/data/notification_repository.dart';
import 'package:pay_day_mobile/modules/notification/domain/notifications.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../../utils/exception_handler.dart';

class NotificationController extends GetxController with StateMixin {
  @override
  void onInit() async {
    await getAllUnreadNotification();
    await getAllNotification();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          _loadMoreData();
        }
      });
    super.onInit();
  }

  final isMoreDataLoading = false.obs;

  void _loadMoreData() async {
    if (notifications.data != null) {
      if (notifications.data!.meta!.currentPage! <
          notifications.data!.meta!.totalPages!) {
        isMoreDataLoading(true);
        await _notificationRepository
            .getAllNotification(
                page: notifications.data!.meta!.currentPage! + 1)
            .then((notifications) {
          notifications.data!.data!
              .map((NotificationData notificationData) =>
                  allNotifications.add(notificationData))
              .toList(growable: true);
          this.notifications = notifications;
        }, onError: (error) => print(error.message));
        isMoreDataLoading(false);
      }
    }
  }

  late ScrollController scrollController;

  final NotificationRepository _notificationRepository =
      NotificationRepository(NetworkClient());

  Notifications notifications = Notifications();

  final length = 0.obs;
  final allNotifications = [].obs;

  getAllNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllNotification().then((notifications) {
      allNotifications.clear();
      notifications.data!.data!
          .map((NotificationData notificationData) =>
              allNotifications.add(notificationData))
          .toList(growable: true);
      this.notifications = notifications;
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }

  getAllUnreadNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllUnreadNotification().then((value) {
      length.value = value.data!.data!.length;
    }, onError: (error) {
      errorChecker(error.message);
    }
    );
    change(null, status: RxStatus.success());
  }

  notificationAsRead(String id) async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.notificationAsRead(id).then((value) {
      getAllNotification();
      getAllUnreadNotification();
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }

  notificationAaALLRead() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.notificationAaALLRead().then((value) {
      getAllNotification();
      getAllUnreadNotification();
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }
}
