import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/drop_dawon_seleted_date.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayslipController extends GetxController with StateMixin {
  SummaryModel summaryModel = SummaryModel();
  PayslipListModel payslipListModel = PayslipListModel();
  PayrunBadgeModel payrunBadgeModel = PayrunBadgeModel();

  List<PayrunBeneficiaryElement> allowance = [];
  List<PayrunBeneficiaryElement> deduction = [];

  List<PayrunBeneficiaryElement> defaultAllowance = [];
  List<PayrunBeneficiaryElement> defaultDeduction = [];

  DropdownBtnStdController dropdownBtnStdController =
      Get.put(DropdownBtnStdController());
  PayslipDataRepository payslipDataRepository =
      PayslipDataRepository(NetworkClient());

  getPayslipListData({value}) async {
    change(null, status: RxStatus.loading());
    await payslipDataRepository
        .getPayslipListRepo(selectedType: value.toString())
        .then((payslipListData) {
      payslipListModel = payslipListData;
    }, onError: (error) {
      if (!Get.isDialogOpen!) {
        errorAlertPopup(_refreshPage);
      }
    });
    change(null, status: RxStatus.success());
  }

  getSummaryData() async {
    change(null, status: RxStatus.loading());
    await payslipDataRepository.getSummaryViewData().then((value) {
      print(value);
      summaryModel = value;
    }, onError: (error) {
      if (!Get.isDialogOpen!) {
        errorAlertPopup(_refreshPage);      }
    });
    change(null, status: RxStatus.success());
  }

  getPayrunBadgeData() async {
    change(null, status: RxStatus.loading());
    await payslipDataRepository.getPayrunBagReoData().then(
        (PayrunBadgeModel value) {
      payrunBadgeModel = value;

      allowance = value.data!.payrunBeneficiaries!
          .where((element) => element.beneficiary!.type == "allowance")
          .toList();
      deduction = value.data!.payrunBeneficiaries!
          .where((element) => element.beneficiary!.type == "deduction")
          .toList();

      defaultAllowance = value.data!.defaultPayrun!.beneficiaries!
          .where((element) => element.beneficiary!.type == "allowance")
          .toList();

      defaultDeduction = value.data!.defaultPayrun!.beneficiaries!
          .where((element) => element.beneficiary!.type == "deduction")
          .toList();
    }, onError: (error) {
      if (!Get.isDialogOpen!) {
        errorAlertPopup(getPayrunBadgeData);
      }
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

  Future<void> _refreshPage() async {
    await getPayslipListData(value: thisYarKey());
    await getSummaryData();
  }
}
