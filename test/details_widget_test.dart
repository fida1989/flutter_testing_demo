import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_demo/api/repository.dart';
import 'package:flutter_testing_demo/pages/details.dart';
import 'package:flutter_testing_demo/utils/constants.dart';
import 'package:flutter_testing_demo/utils/urls.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group("flutter app test", () {
    testWidgets('Details widget test', (WidgetTester tester) async {
      final apiProvider = Repository();
      // Set optional mock client
      apiProvider.client = MockClient((request) async {
        var mapJson;
        if (request.url.toString() == Urls.all) {
          mapJson = Constants.allData;
        } else if (request.url.toString() == Urls.single) {
          mapJson = Constants.oneData;
        } else {
          mapJson = {};
        }
        return Response(json.encode(mapJson), 200);
      });
      //apiProvider.client = Client();
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
      expect(value, findsNWidgets(2));

      var list = find.byType(ListView);
      expect(list, findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(16));

      expect(find.text("10"), findsOneWidget);

      expect(find.text("qui est esse"), findsOneWidget);
    });
  });
}
