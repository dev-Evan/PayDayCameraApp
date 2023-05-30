import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/common/domain/success_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../domain/notifications.dart';

class NotificationRepository {
  final NetworkClient networkClient;

  NotificationRepository(this.networkClient);

  Future<Notifications> getAllNotification({int? page = 1}) async {
    try {
      Response response = await networkClient.getRequest(
          "${AppString.ALL_NOTIFICATION}?timezone=${DateTime.now().toUtc().timeZoneName}&page=$page&per_page=8");
      print(
          "${AppString.ALL_NOTIFICATION}?timezone=${DateTime.now().toUtc().timeZoneName}&page=$page&per_page=8");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return Notifications.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<Notifications> getAllUnreadNotification() async {
    try {
      Response response = await networkClient.getRequest(
          "${AppString.ALL_UNREAD_NOTIFICATION}&timezone=${DateTime.now().toUtc().timeZoneName}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return Notifications.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> notificationAsRead(String id) async {
    try {
      Response response =
          await networkClient.getRequest("${AppString.NOTICATION_AS_READ}/$id");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> notificationAaALLRead() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.NOTIFICATION_AS_ALL_READ);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }
}
