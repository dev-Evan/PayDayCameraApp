import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';

import '../domain/announcement_model.dart';

class AnnouncementRepository {
  NetworkClient networkClient = NetworkClient();

  AnnouncementRepository(this.networkClient);

  Future<AnnouncementModel> getAnnouncement({required int pageInt}) async {
    try {
      Response response = await networkClient
          .getRequest("${Api.ANNOUNCEMENT}?page=$pageInt&per_page=5");
      print("Api Called :::: ${"${Api.ANNOUNCEMENT}?page=$pageInt&per_page=5"}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Announcement Called ::: ${response.body}");
        return AnnouncementModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
