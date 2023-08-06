import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/api_check_controller.dart';
import 'package:pay_day_mobile/modules/notification/data/notification_repository.dart';
import 'package:pay_day_mobile/modules/notification/domain/notifications.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../../common/widget/error_message.dart';
import '../../../../common/widget/warning_message.dart';

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
      CheckForApi().checkForApi(error);
    });

    change(null, status: RxStatus.success());
  }

  getAllUnreadNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllUnreadNotification().then((value) {
      print("getAllUnreadNotification ::: called ${value.data!.data!.length}");
      length.value = value.data!.data!.length;
    }, onError: (error) {
      CheckForApi().checkForApi(error);
    }

    );

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

  checkForApi( dynamic error) {
    if (error.message.startsWith("'Null' is not a subtype of type 'Map<String, dynamic>'")) {
      print(" Leave identify error handling");
      showWarningMessage(message: "Some information might go missing. Refresh by pulling down the screen page for the application to run smoothly");
    } else if (error.message.startsWith(
        "TimeoutException after 0:00:10.000000: Future not completed")) {
      showErrorMessage(errorMessage: "Something wrong, please check your internet connection");
    }else if(error.message.contains('Null')){
      showWarningMessage(message: "52645 :: Some information might go missing. Refresh by pulling down the screen page for the application to run smoothly");

    }
    else{
      //  showErrorMessage(errorMessage: error.message);
      print("else test");

    }
  }


}
