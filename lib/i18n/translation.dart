import 'package:e_commerce/i18n/en.dart';
import 'package:e_commerce/i18n/ur.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': EnglishLocale.en_US,
    'ur_PK': UrduLocale.ur_PK,
  };
}
