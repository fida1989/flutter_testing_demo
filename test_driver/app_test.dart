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
    var textField = find.byType("TextField");
    var button = find.text("Reverse");
    var reverse = find.text("olleH");
    test("reverse the string", () async {
      await driver.tap(textField);
      await driver.enterText("Hello");
      await driver.waitForAbsent(reverse);
      await driver.tap(button);
      await driver.waitFor(reverse);
      await driver.waitUntilNoTransientCallbacks();
      assert(reverse != null);
    });
  });
}
