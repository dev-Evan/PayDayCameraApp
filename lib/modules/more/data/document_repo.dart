import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DocumentRepository {
  final NetworkClient networkClient;
  DocumentRepository(this.networkClient);
  Future<DocumentModel> getDocumentRepoData() async {
    try {
      Response response = await networkClient.getRequest(
           AppString.DOCUMENT_LIST, );
      print("Document list called ${response.body}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return DocumentModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}
