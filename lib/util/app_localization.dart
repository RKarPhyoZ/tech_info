import 'localization/english.dart';
import 'localization/thailand.dart';

enum AppLanguages { en, th}

abstract class AppLocalization {
  static Map<String, Map<String, String>> translationsKeys = {
    AppLanguages.en.name: en,
    AppLanguages.th.name: th,
  };
}
