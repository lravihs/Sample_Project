import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:at_test/utils/app_config_model.dart';
import 'package:at_test/utils/globals.dart' as globals;
import 'package:at_test/utils/localization_service.dart';
import 'package:at_test/utils/route_config.dart';
import 'package:timezone/data/latest.dart' as tz;



Future<void> mainCommon(AppCommonSettings appCommonSettings) async {
  await Get.putAsync(() => LocalizationService().init());
  tz.initializeTimeZones();
  runApp(AtTestApp(appCommonSettings: appCommonSettings));
  FlutterNativeSplash.remove();
}

class AtTestApp extends StatefulWidget {
  AtTestApp({Key? key, this.appCommonSettings}) : super(key: key);
  final AppCommonSettings? appCommonSettings;

  @override
  State<StatefulWidget> createState() => _AtTestAppState();
}

class _AtTestAppState extends State<AtTestApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  Locale appLocale = LocalizationService().fallbackLocale;

  @override
  void initState() {
    getConfigNames();
    fetchAppLanguage();
    super.initState();
  }

  Future<void> fetchAppLanguage() async {
    String? localeLanguage = "en_US";
    localeLanguage =
        "${Get.deviceLocale!.languageCode}_${Get.deviceLocale!.countryCode.toString().toUpperCase()}";
    if (localeLanguage == null || localeLanguage.isEmpty) {
      localeLanguage = 'en_US';
    }
    var languageCode = <String>[];
    if (localeLanguage.contains('_')) {
      languageCode.insert(
          0, localeLanguage.substring(0, localeLanguage.indexOf('_')));
      languageCode.insert(
          1,
          localeLanguage.substring(
              localeLanguage.indexOf('_') + 1, localeLanguage.length));
      appLocale = Locale(languageCode.elementAt(0), languageCode.elementAt(1));
    } else {
      languageCode.insert(0, localeLanguage);
      appLocale = Locale(languageCode.elementAt(0));
    }
  }

  String getRouteName() {
    return initRoutes();
  }

  String initRoutes() {

      return RouteName.FIRST_SCREEN;

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: getRouteName(),
      getPages: RouteCollection.routeCollections,
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
      ),
      navigatorKey: navigatorKey,
      locale: (appLocale == null) ? Get.deviceLocale : appLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Get.find<LocalizationService>().supportedLocales(),
      translationsKeys: Get.find<LocalizationService>().localizations,
      fallbackLocale: Get.find<LocalizationService>().fallbackLocale,
    );
  }

  getConfigNames() {
    globals.appCommonSettings = widget.appCommonSettings!;
    globals.SigninButtonText = 'login_button_name';
    globals.SignupButtonText = 'register_button_name';
    globals.TitleText = 'title_text';
    globals.ContentText = 'content_text';
    globals.NextButtonText = 'next_button_name';

  }
}
