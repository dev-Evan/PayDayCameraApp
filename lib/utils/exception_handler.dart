import 'package:pay_day_mobile/common/widget/warning_message.dart';

import '../common/widget/error_message.dart';

  errorChecker(String error) {
    if (error.startsWith("type 'Null'")) {
      showWarningMessage(message: "Some information might go missing. Refresh by pulling down the screen page for the application to run smoothly.", height: 100, maxLines: 4);
    } else if (error.startsWith("TimeoutException")) {
      showErrorMessage(errorMessage: "Something went wrong, please check your internet connection.");
    }
    else {
      showErrorMessage(errorMessage: error);
    }
  }
