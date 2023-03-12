import 'package:get/get.dart';

const String BASE_URL = "https://payday.php8.gainhq.com/api";

class NetworkClient extends GetConnect {
  Future<Response> getRequest(String apiEndPoint) async {
    return await get(_getRequestUrl(apiEndPoint), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    }).timeout(const Duration(seconds: 20));
  }

  Future<Response> postRequest(String apiEndPoint, dynamic payload) async {
    Response response = await post(_getRequestUrl(apiEndPoint), payload,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }).timeout(const Duration(seconds: 20));
    return response;
  }

  String _getRequestUrl(String apiEndPoint) => BASE_URL + apiEndPoint;
}
