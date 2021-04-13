import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("flutter app test", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
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
    //
    test("reverse the string", () async {
      await driver.tap(textField);
      await driver.enterText("Hello");
      await driver.waitForAbsent(reverse);
      await driver.tap(button);
      await driver.waitFor(reverse);
      await driver.waitUntilNoTransientCallbacks(timeout: Duration(seconds: 2));
      assert(reverse != null);
      await driver.tap(details);
      //await driver.waitUntilNoTransientCallbacks();
      //await driver.waitFor(hello);
      //await driver.tap(hello);
      //await driver.enterText("Yes Yes");
      await driver.waitUntilNoTransientCallbacks();
      Future.delayed(Duration(seconds: 2),() async {
        await driver.tap(back);
      });

    });
  });
}
