import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:at_test/main_lalluk.dart' as app;

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    nativeAutomation: true,
        ($) async {
      app.main();

      await $('Next').tap();
      expect($('Continue'), findsOneWidget);
      await $.native.pressHome();
    },
  );
}
