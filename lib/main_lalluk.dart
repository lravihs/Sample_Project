import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'main.dart';
import 'utils/app_config_model.dart';


void main() async {

  String flavorName = "lalluk";
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final jsonAppSettingsString = await rootBundle.loadString('lib/assets/flavors/$flavorName/app_settings.json');
  final AppCommonSettings appCommonSettings = AppCommonSettings.fromJson(jsonDecode(jsonAppSettingsString));

  mainCommon(appCommonSettings);
}




