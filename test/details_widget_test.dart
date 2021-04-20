import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_demo/api/api_provider.dart';
import 'package:flutter_testing_demo/pages/details.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group("flutter app test", () {
    testWidgets('Details widget test', (WidgetTester tester) async {
      final apiProvider = ApiProvider();
      // Set optional mock client
      apiProvider.client = MockClient((request) async {
        final mapJson = {'id': 1, 'name': 'flutter'};
        return Response(json.encode(mapJson), 200);
      });
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: DetailsPage(
            apiProvider: apiProvider,
          ),
        ),
      ));
      var loading = find.text("Loading...");
      expect(loading, findsOneWidget);

      await tester.pumpAndSettle();
      var value = find.text("1");
      expect(value, findsOneWidget);
    });
  });
}
