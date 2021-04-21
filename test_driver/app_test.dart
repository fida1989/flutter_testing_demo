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
    //
    test("home screen test", () async {
      await driver.waitFor(find.text(DateTime.now().year.toString()));
      await driver.tap(find.byType("TextField"));
      await driver.enterText("Hello");
      await driver.waitForAbsent(find.text("olleH"));
      await driver.tap(find.text("Reverse"));
      await driver.waitFor(find.text("olleH"));
      await driver.waitUntilNoTransientCallbacks(timeout: Duration(seconds: 2));
      await driver.tap(find.text("Details"));
    });
    //
    test("details screen test", () async {
      await driver.waitFor(find.text("Loading..."));
      await driver.waitUntilNoTransientCallbacks(timeout: Duration(seconds: 2));
      await driver.waitFor(find.text("1"));
      await driver.waitFor(find.byType("ListView"));
      await driver.tap(find.text("qui est esse"),timeout: Duration(seconds: 2));
      await driver.waitUntilNoTransientCallbacks(timeout: Duration(seconds: 2));
      await driver.tap(find.text("Back"));
    });
  });
}
