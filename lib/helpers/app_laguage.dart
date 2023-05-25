import 'package:flutter/cupertino.dart';
import 'package:qoute_app/languages/en.dart';
import 'package:qoute_app/languages/vi.dart';
import 'package:qoute_app/utils/app.dart';

class AppLanguage {
  Locale locale;

  AppLanguage(this.locale);

  static const Map<String, Map> languages = {
    "vi": viTranslates,
    "en": enTranslates,
  };

  static List<Locale> get supportLanguages =>
      languages.keys.map((e) => Locale(e)).toList();

  static AppLanguage getInstance() => Localizations.of<AppLanguage>(
        getCurrentContext,
        AppLanguage,
      )!;

  String tr(String key) {
    dynamic translate = languages[locale.languageCode] ?? {};
    for (String k in key.split(".")) {
      translate = translate[k] ?? key;
      if (translate is Map) {
        continue;
      }
      return translate;
    }
    return key;
  }
}

class AppLocalizationDelegation extends LocalizationsDelegate<AppLanguage> {
  @override
  bool isSupported(Locale locale) =>
      AppLanguage.languages.keys.contains(locale.languageCode);

  @override
  Future<AppLanguage> load(Locale locale) async {
    AppLanguage appLanguage = AppLanguage(locale);
    debugPrint("load ${locale.languageCode} language");
    return appLanguage;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLanguage> old) => false;
}
