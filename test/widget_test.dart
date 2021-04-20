import 'package:flutter/material.dart';
import 'package:flutter_testing_demo/details.dart';
import 'package:flutter_testing_demo/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){


  group("flutter app test", () {
    testWidgets('Main widget test 111', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());//

      var text = find.text("Hello Test");
      expect(text, findsOneWidget);
      //
      var textField = find.byKey(Key("myKey"));
      //var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      //
      await tester.enterText(textField, 'Hello1');
      //
      expect(find.text('Hello1'), findsOneWidget);
      //
      var button = find.text("Reverse");
      expect(button,findsOneWidget);
      //
      await tester.tap(button);
      //
      await tester.pump();
      //
      expect(find.text("1olleH"),findsOneWidget);
    });

    /*testWidgets('Main widget test 222', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());//

      var text = find.text("Hello Test");
      expect(text, findsOneWidget);
      //
      var textField = find.byKey(Key("myKey"));
      //var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      //
      await tester.enterText(textField, 'Hello1');
      //
      expect(find.text('Hello1'), findsOneWidget);
      //
      var button = find.text("Reverse");
      expect(button,findsOneWidget);
      //
      await tester.tap(button);
      //
      await tester.pump();
      //
      expect(find.text("1olleH"),findsOneWidget);
    });*/
  });
}