import 'dart:ui';

import 'package:qoute_app/languages/en.dart';
import 'package:qoute_app/languages/vi.dart';

class AppLanguage{
  static const Map<String, Map> languages = {
    "vi": viTranslates,
    "en": enTranslates,
  };
  static List<Locale> get supportLanguages => languages.keys.map((e) => Locale(e)).toList();
}