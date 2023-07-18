import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/modules/notification/data/notification_repository.dart';
import 'package:pay_day_mobile/modules/notification/domain/notifications.dart';
import 'package:pay_day_mobile/network/network_client.dart';

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
    print("loadMoreData :: Called");
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
          print(allNotifications.length);
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
      print("getAllNotification ::: called");
      allNotifications.clear();
      notifications.data!.data!
          .map((NotificationData notificationData) =>
              allNotifications.add(notificationData))
          .toList(growable: true);
      print(allNotifications.length);
      this.notifications = notifications;
      print(notifications.data!.meta!.total);
    }, onError: (error) {
      errorAlertPopup(_reloadPage);
    });

    change(null, status: RxStatus.success());
  }

  getAllUnreadNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllUnreadNotification().then((value) {
      print("getAllUnreadNotification ::: called ${value.data!.data!.length}");
      length.value = value.data!.data!.length;
    }, onError: (error) {
      errorAlertPopup(_reloadPage);
    });

    change(null, status: RxStatus.success());
  }

  notificationAsRead(String id) async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.notificationAsRead(id).then((value) {
      print("notificationAsRead ::: called");
      getAllNotification();
      getAllUnreadNotification();
    }, onError: (error) => print("notificationAsRead ${error.message}"));

    change(null, status: RxStatus.success());
  }

  notificationAaALLRead() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.notificationAaALLRead().then((value) {
      print("notificationAaALLRead ::: called");
      getAllNotification();
      getAllUnreadNotification();
    }, onError: (error) => print("notificationAaALLRead ${error.message}"));

    change(null, status: RxStatus.success());
  }

  _reloadPage() async {
    await getAllUnreadNotification();
    await getAllNotification();
  }
}
