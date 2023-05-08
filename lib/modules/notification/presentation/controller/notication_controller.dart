import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/data/notification_repository.dart';
import 'package:pay_day_mobile/modules/notification/domain/notifications.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class NotificationController extends GetxController with StateMixin {
  final NotificationRepository _notificationRepository =
      NotificationRepository(NetworkClient());

  Notifications notifications = Notifications();

  getAllNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllNotification().then((value) {
      print("getAllNotification ::: called");
      notifications = value;
    }, onError: (error) => print("getAllNotification ${error.message}"));

    change(null, status: RxStatus.success());
  }

  notificationAsRead(String id) async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.notificationAsRead(id).then((value) {
      print("notificationAsRead ::: called");
    }, onError: (error) => print("notificationAsRead ${error.message}"));

    change(null, status: RxStatus.success());
  }

  notificationAaALLRead() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.notificationAaALLRead().then((value) {
      print("notificationAaALLRead ::: called");
    }, onError: (error) => print("notificationAaALLRead ${error.message}"));

    change(null, status: RxStatus.success());
  }
}
