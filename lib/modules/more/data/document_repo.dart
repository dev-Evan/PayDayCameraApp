import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/modules/more/domain/job_history_model.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../common/domain/error_model.dart';
import '../../../utils/app_string.dart';


class DocumentRepository {
  final NetworkClient networkClient;

  DocumentRepository(this.networkClient);

  Future<DocumentModel> getDocumentRepoData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.DOCUMENT_LIST);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return DocumentModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


