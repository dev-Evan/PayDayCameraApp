import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';

class SalaryOverViewRepository {
  final NetworkClient networkClient;

  SalaryOverViewRepository(this.networkClient);

  Future<SalaryOverViewModel> getSalaryOverViewData() async {
    try {
      Response response =
      await networkClient.getRequest(Api.SALARY_OVERVIEW);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Salary overview ::: ${response.body}");
        return SalaryOverViewModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


