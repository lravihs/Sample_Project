import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:at_test/module/launch_controller.dart';
import 'package:at_test/utils/globals.dart' as globals;

class LaunchScreen extends GetView<LaunchController> {
  LaunchScreen({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Future.value(true),
      child: Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.black.withOpacity(0.4),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: GetBuilder<LaunchController>(
            builder: (controller) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: CarouselSlider.builder(
                                  itemCount: controller.imagearr.length,
                                  itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) =>
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.5,
                                        child: Image.asset(
                                          controller.imagearr[itemIndex],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  options: CarouselOptions(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.5,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 1,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 300),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: false,
                                      enlargeFactor: 0.1,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {
                                        controller.current = index;
                                        controller.update();
                                      }))),
                          Positioned(
                            bottom: 1,
                            child: Semantics(
                              focusable: false,
                              focused: false,
                              excludeSemantics: true,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: controller.imagearr
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    return GestureDetector(
                                      onTap: () => controller.carouselController
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (controller.current ==
                                                        entry.key
                                                    ? Colors.green
                                                    : Colors.white)
                                                .withOpacity(controller.current ==
                                                        entry.key
                                                    ? 0.9
                                                    : 0.4)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: MediaQuery.of(context).size.width*0.08),
                      Container(
                          height: globals.isOrderNowButtonEnabled ? 40 : 0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor:Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 1.25,
                                  40), //////// HERE
                            ),
                            onPressed: () {
                            },
                            child: Text(
                                key: ValueKey('landing_ordernow_btn'),
                                globals.landingOrderNowButtonText.tr.length > 40
                                    ? controller.addEllipsis(
                                        "${globals.landingOrderNowButtonText.tr}"
                                            .substring(0, 38))
                                    : "${globals.landingOrderNowButtonText.tr}",
                                semanticsLabel:
                                    globals.landingOrderNowButtonTextSemantics.tr,
                                style: TextStyle(
                                    fontFamily: "${globals.font1}",
                                    fontSize: 20)),
                          )),
                       SizedBox(height: MediaQuery.of(context).size.width*0.05),
                      Container(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 1.25,
                                  40), //////// HERE
                            ),
                            onPressed: () {
                            },
                            child: Text(
                                globals.SigninButtonText.tr.length > 40
                                    ? controller.addEllipsis(globals
                                        .SigninButtonText.tr
                                        .substring(0, 38))
                                    : globals.SigninButtonText.tr,
                                semanticsLabel:
                                    globals.landingSigninButtonTextSemantics.tr,
                                style: TextStyle(
                                    fontFamily: "${globals.font1}",
                                    fontSize: 20)),
                          )),
                       SizedBox(height: MediaQuery.of(context).size.width*0.05),
                      Container(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 1.25,
                                  40), //////// HERE
                            ),
                            onPressed: () {
                            },
                            child: Text(
                                globals.SignupButtonText.tr.length > 40
                                    ? controller.addEllipsis(globals
                                        .SignupButtonText.tr
                                        .substring(0, 38))
                                    : globals.SignupButtonText.tr,
                                semanticsLabel:
                                    globals.landingSignupButtonTextSemantics.tr,
                                style: TextStyle(
                                    fontFamily: "${globals.font1}",
                                    fontSize: 20)),
                          )),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
     //   drawer: CustomSiderDrawer(),
      ),
    );
  }
}
