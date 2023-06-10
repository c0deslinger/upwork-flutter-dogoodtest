import 'package:get/get.dart';

import 'en.dart';
import 'id.dart';

class AppTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {"id": languageId, "en": languageEn};
}
