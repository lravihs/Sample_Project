import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:at_test/utils/asset_config.dart';


class LaunchController extends GetxController with WidgetsBindingObserver {

  var imagearr = [
    LANDING_BANNER_IMAGE_1,
    LANDING_BANNER_IMAGE_2,
    LANDING_BANNER_IMAGE_3
  ];
  int current = 0;

  final CarouselController carouselController = CarouselController();
  Locale onPausedLocal = Locale("en", "US");

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  String addEllipsis(String value) {
    return value.toString() + "..";
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {

    }
    if (state == AppLifecycleState.paused) {
    }
  }




}
