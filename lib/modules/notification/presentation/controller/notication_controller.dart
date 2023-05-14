import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/notification/data/notification_repository.dart';
import 'package:pay_day_mobile/modules/notification/domain/notifications.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class NotificationController extends GetxController with StateMixin {
  @override
  void onInit() async {
    await getAllUnreadNotification();
    super.onInit();
  }

  final NotificationRepository _notificationRepository =
  NotificationRepository(NetworkClient());

  Notifications notifications = Notifications();

  final length = 0.obs;

  getAllNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllNotification().then((value) {
      print("getAllNotification ::: called");
      notifications = value;
    }, onError: (error) => print("getAllNotification ${error.message}"));

    change(null, status: RxStatus.success());
  }

  getAllUnreadNotification() async {
    change(null, status: RxStatus.loading());
    await _notificationRepository.getAllUnreadNotification().then((value) {
      print("getAllUnreadNotification ::: called ${value.data!.data!.length}");
      length.value = value.data!.data!.length;
    }, onError: (error) => print("getAllUnreadNotification ${error.message}"));

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
}
