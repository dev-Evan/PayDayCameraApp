import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class PayslipListRepository {
  final NetworkClient networkClient;
  PayslipListRepository(this.networkClient);
  Future<PayslipListModel> getPayslipListRepo(
      {required String selectedType}) async {
    var queryParams = {
      "within": selectedType.isEmpty?"total":selectedType,
    };
    try {
      Response response = await networkClient.getQueryRequest(
          apiEndPoint: AppString.PAYSLIP_LIST, query: queryParams);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);

        return PayslipListModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}
