import 'package:pay_day_mobile/common/widget/warning_message.dart';

import '../common/widget/error_message.dart';

class ExceptionHandler{
  errorChecker(dynamic error) {
    if (error.message.startsWith("type 'Null' is not a subtype of type 'Map<String, dynamic>'")) {

      showWarningMessage(message: "Some information might go missing. Refresh by pulling down the screen page for the application to run smoothly.", height: 100, maxLines: 4);

    } else if (error.message.startsWith("TimeoutException")) {

      showErrorMessage(errorMessage: "Something went wrong, please check your internet connection.");
    } else if (error.message.startsWith("ClientException with SocketException")) {

      showErrorMessage(errorMessage: "Something went wrong, please check your internet connection.");
    }else if (error.message.startsWith("Null",
        height: 100, maxLines: 4)) {
      showErrorMessage(errorMessage: "Something went wrong, please check your internet connection.");
    }
    else if (error.message.startsWith("Network is unreachable")) {

      showErrorMessage(errorMessage: "Something went wrong, please check your internet connection.");
    }
    else {
      showErrorMessage(errorMessage: error.message);
    }
  }
}