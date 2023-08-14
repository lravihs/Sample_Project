import 'package:get/get.dart';
import 'package:at_test/module/launch_controller.dart';

class LaunchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaunchController());
  }
}

class FirstScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstScreenBinding());
  }
}



