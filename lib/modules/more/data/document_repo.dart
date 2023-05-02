import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../common/domain/error_model.dart';
import '../../../utils/app_string.dart';

class DocumentRepository {
  final NetworkClient networkClient;
  DocumentRepository(this.networkClient);
  final _box = GetStorage();
  Future<DocumentModel> getDocumentRepoData() async {
    var queryParams = {
      'page': _box.read(AppString.ID_STORE).toString(),
    };

    try {
      Response response = await networkClient.getQueryRequest(
          apiEndPoint: AppString.DOCUMENT_LIST, query: queryParams);
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
