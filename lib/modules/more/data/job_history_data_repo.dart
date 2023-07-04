import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/domain/job_history_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';


class JobHistoryRepository {
  final NetworkClient networkClient;

  JobHistoryRepository(this.networkClient);

  Future<JobHistoryModel> getJobHistoryRepoData() async {
    try {
      Response response =
      await networkClient.getRequest(Api.JOB_HISTORY);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Job History Called ::: ${response.body}");
        return JobHistoryModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }
}


