import 'dart:convert' as convert;
import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocalizationService extends GetxService {
  final localizations = <String, Map<String, String>>{}.obs;
  final fallbackLocale = const Locale('en', 'US');
  static final languages = [
    'en_GB',
    'en',
  ];

  Future<LocalizationService> init() async {
    final List<Locale> systemLocales = window.locales;
    print(systemLocales);
    print(Platform.localeName);
    print(Get.locale);
    for (var lang in languages) {
      var file = await _getJsonFile( lang == 'en' ? 'lib/assets/flavors/lalluk/string_settings/${lang}_US.json' : 'lib/assets/flavors/lalluk/string_settings/en_US.json');
      localizations.putIfAbsent(lang, () => Map<String, String>.from(file));
    }
    return this;
  }

  List<Locale> supportedLocales() {
    return LocalizationService.languages.map((locale) {
      return fromStringToLocale(locale);
    }).toList();
  }

  Locale fromStringToLocale(String locale) {
    if (locale.contains('_')) {
      return Locale(
          locale.split('_').elementAt(0), locale.split('_').elementAt(1));
    } else {
      return Locale(locale);
    }
  }

  Future<dynamic> _getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
}
