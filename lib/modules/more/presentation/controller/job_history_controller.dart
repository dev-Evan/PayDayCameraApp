import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/exception_handler.dart';
import 'package:pay_day_mobile/modules/more/data/job_history_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/job_history_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/logger.dart';

class JobHistoryController extends GetxController with StateMixin {
  JobHistoryModel jobHistoryModel =JobHistoryModel();
  JobHistoryRepository jobHistoryRepository =
  JobHistoryRepository(NetworkClient());
  //get job history here
  getJobHistoryData() async {
    change(null, status: RxStatus.loading());
      await jobHistoryRepository.getJobHistoryRepoData().then((JobHistoryModel value) {
        jobHistoryModel = value;
      }, onError: (error) {
        errorChecker(error.message);
        LoggerHelper.errorLog(message: error.message);
      });
    change(null, status: RxStatus.success());
  }
}
