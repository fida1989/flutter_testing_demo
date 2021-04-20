import 'package:flutter_testing_demo/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Home test', () {
    test('String should be reversed', () {
      String initial = "Hello";
      String reversed = Utils.reverseString(initial);
      expect(reversed, 'olleH');
    });
    test('String should be current year', () {
      String year = Utils.getYear();
      expect(year, DateTime.now().year.toString());
    });
  });
}
