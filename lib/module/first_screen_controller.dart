import 'package:get/get.dart';
import 'package:at_test/utils/route_config.dart';

class FirstScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  navigateToLanding() {
    Get.offAllNamed(RouteName.LAUNCH_SCREEN);
  }
}
