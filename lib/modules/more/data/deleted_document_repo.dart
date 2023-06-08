import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/domain/deleted_document_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';

class DeleteDocumentRepository {
  final NetworkClient networkClient;
  DeleteDocumentRepository(this.networkClient);
  Future<DeletedDocModel> deletedDocRepo(
    String id,
  ) async {
    try {
      Response response = await networkClient.postRequest(
        Api.DELETED_DOCUMENT,
        {
          "id": id,
        },
      );
      print(response.body.toString());
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Deleted document ::: ${response.body}");

        return DeletedDocModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
