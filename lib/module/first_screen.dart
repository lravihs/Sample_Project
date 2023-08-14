import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:at_test/module/first_screen_controller.dart';
import 'package:at_test/utils/asset_config.dart';
import 'package:at_test/utils/globals.dart' as globals;

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final FirstScreenController controller =
      Get.put(FirstScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Future.value(true),
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const SizedBox(),
        ),
        body: Form(
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                      BACKGROUND_LOCATION_IMAGE,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                 SizedBox(
                    height: MediaQuery.of(context).size.height*0.03
                ),
                Column(children: [
                  Text(
                    globals.TitleText.tr,
                    style: const TextStyle(color: Colors.green, fontSize: 30)
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      globals.ContentText.tr,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ]),
                 SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                SizedBox(
                  width:  MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.navigateToLanding();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green) // Text Color (Foreground color)
                        ),
                    child: Text(
                      globals.NextButtonText.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
