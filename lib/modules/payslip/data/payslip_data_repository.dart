import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_view_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/drop_dawon_seleted_date.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class PayslipDataRepository {
  final NetworkClient networkClient;
  PayslipDataRepository(this.networkClient);

  Future<PayslipListModel> getPayslipListRepo(
      {required String selectedType}) async {
    var queryParams = {
      "date_range": selectedType.isEmpty ? thisYarKey() : selectedType,
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

  Future<PayrunBadgeModel> getPayrunBagReoData() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.PAYRUN_BADGE);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return PayrunBadgeModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }

  Future<SummaryModel> getSummaryViewData() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.PAYSLIP_SUMMARY);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return SummaryModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }

  Future<PayslipViewModel> getPayslipViewData({required indexId})async {
    try {
      Response response = await networkClient.getRequest(AppString.PAYSLIP_VIEW+indexId);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return PayslipViewModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}











