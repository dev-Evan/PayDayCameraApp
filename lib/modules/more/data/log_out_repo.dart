import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/modules/more/domain/logout_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';


class LogoutRepository {
  final NetworkClient networkClient;
  LogoutRepository(this.networkClient);

  Future<LogoutModel> getLogoutRepoData() async {
    try {
      Response response =
      await networkClient.getRequest(Api.LOG_OUT);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Logout Called ::: ${response.body}");
        return LogoutModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


