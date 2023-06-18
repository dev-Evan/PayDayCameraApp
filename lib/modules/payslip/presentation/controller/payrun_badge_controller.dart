import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayrunBadgeController extends GetxController with StateMixin {

  PayrunBadgeModel payrunBadgeModel = PayrunBadgeModel();
  PayslipDataRepository payrunBadgeRepository = PayslipDataRepository(NetworkClient());


  List<PayrunBeneficiaryElement> allowance=[];
  List<PayrunBeneficiaryElement> deduction=[];

  getPayrunBadgeData() async {
    change(null, status: RxStatus.loading());
    try {
      await payrunBadgeRepository.getPayrunBagReoData().then(
          (PayrunBadgeModel value) {
        print(value);
       allowance= value.data!.payrunBeneficiaries!
            .where((element) => element.beneficiary!.type == "allowance")
            .toList();
        deduction = value.data!.payrunBeneficiaries!
            .where((element) => element.beneficiary!.type == "deduction")
            .toList();
        print("pay allowance:::: ${allowance.length}");
        print("pay deduction:::: ${deduction.length}");

        payrunBadgeModel = value;
      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }





}
