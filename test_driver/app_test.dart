import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("flutter app test", () {
    //declaration
    FlutterDriver driver;
    //constructor
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    //destructor
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    //home
    var textField = find.byType("TextField");
    var button = find.text("Reverse");
    var reverse = find.text("olleH");
    //details
    var details = find.text("Details");
    var hello = find.text("Hello");
    var back = find.text("Back");
    var initial = find.text("Loading...");
    var result = find.text("1");
    //
    test("home screen test", () async {
      await driver.tap(textField);
      await driver.enterText("Hello");
      await driver.waitForAbsent(reverse);
      await driver.tap(button);
      await driver.waitFor(reverse);
      await driver.waitUntilNoTransientCallbacks(timeout: Duration(seconds: 2));
      assert(reverse != null);
      await driver.tap(details);
    });


    test("details screen test", () async {
      //await driver.waitUntilNoTransientCallbacks();
      await driver.waitFor(initial);
      await driver.waitFor(result);
      await driver.tap(back);
      //await driver.tap(hello);
      //await driver.enterText("Yes Yes");
      //await driver.waitUntilNoTransientCallbacks();
      /*Future.delayed(Duration(seconds: 2),() async {
        await driver.tap(back);
      });*/
    });
  });
}
