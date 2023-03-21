import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:get_storage/get_storage.dart';


class NetworkClient extends GetConnect {
  Future<Response> getRequest(String apiEndPoint) async {
    return await get(_getRequestUrl(apiEndPoint), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": GetStorage().read(AppString.ACCESS_TOKEN) != null
          ? "Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}"
          : ""
    }).timeout(const Duration(seconds: 20));
  }

  Future<Response> postRequest(String apiEndPoint, dynamic payload) async {
    Response response =
        await post(_getRequestUrl(apiEndPoint), payload, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json; charset=UTF-8",
      "Authorization": GetStorage().read(AppString.ACCESS_TOKEN) != null
          ? "Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}"
          : ""
    }).timeout(const Duration(seconds: 20));
    return response;
  }

  String _getRequestUrl(String apiEndPoint) => AppString.BASE_URL + apiEndPoint;
}
