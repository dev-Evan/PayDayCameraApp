import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayrunBadgeController extends GetxController with StateMixin {

  PayrunBadgeModel payrunBadgeModel = PayrunBadgeModel();
  PayslipDataRepository payrunBadgeRepository = PayslipDataRepository(NetworkClient());


  List<PayrunBeneficiaryElement> allowance=[];
  List<PayrunBeneficiaryElement> deduction=[];

  List<PayrunBeneficiaryElement> defaultAllowance=[];
  List<PayrunBeneficiaryElement> defaultDeduction=[];

  getPayrunBadgeData() async {
    change(null, status: RxStatus.loading());
    try {
      await payrunBadgeRepository.getPayrunBagReoData().then(
          (PayrunBadgeModel value) {
        print(value);
        payrunBadgeModel = value;

        allowance= value.data!.payrunBeneficiaries!
            .where((element) => element.beneficiary!.type == "allowance")
            .toList();
        deduction = value.data!.payrunBeneficiaries!
            .where((element) => element.beneficiary!.type == "deduction")
            .toList();

        defaultAllowance= value.data!.defaultPayrun!.beneficiaries!
            .where((element) => element.beneficiary!.type == "allowance")
            .toList();

        defaultDeduction = value.data!.defaultPayrun!.beneficiaries!
            .where((element) => element.beneficiary!.type == "deduction")
            .toList();


        print("pay allowance:::: ${allowance.length}");
        print("pay deduction:::: ${deduction.length}");

        print("pay allowance:::: ${defaultAllowance.length}");
        print("pay deduction:::: ${defaultDeduction.length}");


      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }





}
