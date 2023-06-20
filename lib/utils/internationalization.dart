import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/language/bangla.dart';
import 'package:pay_day_mobile/utils/language/english.dart';

class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
