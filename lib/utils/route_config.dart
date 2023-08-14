import 'package:get/get.dart';
import 'package:at_test/module/first_screen.dart';
import 'package:at_test/module/launch_screen.dart';
import '../navigations/binding.dart';

abstract class RouteName {
  static const LAUNCH_SCREEN = '/launch';
  static const FIRST_SCREEN =
      '/background_location_access';

}

class RouteCollection {
  static final routeCollections = [
    GetPage(
      name: RouteName.LAUNCH_SCREEN,
      page: () => LaunchScreen(),
      binding: LaunchBinding(),
    ),
    GetPage(
      name: RouteName.FIRST_SCREEN,
      page: () => FirstScreen(),
      binding: FirstScreenBinding(),
    ),

  ];
}
