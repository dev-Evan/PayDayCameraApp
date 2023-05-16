import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/job_history_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/job_history_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class JobHistoryController extends GetxController with StateMixin {
  JobHistoryModel? jobHistoryModel;
  JobHistoryRepository jobHistoryRepository =
  JobHistoryRepository(NetworkClient());

  getJobHistoryData() async {
    change(null, status: RxStatus.loading());
    try {
      await jobHistoryRepository.getJobHistoryRepoData().then((value) {
        print(value);
        jobHistoryModel = value;
      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
