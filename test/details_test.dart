import 'dart:convert';

import 'package:flutter_testing_demo/api/api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('Details test', () {
    test("Testing the api call", () async {
      //setup the test
      final apiProvider = ApiProvider();
      // Set optional mock client
      apiProvider.client = MockClient((request) async {
        final mapJson = {'id': 1, 'name': 'flutter'};
        return Response(json.encode(mapJson), 200);
      });
      final item = await apiProvider.fetchPosts();
      expect(item.id, 1);
    });
  });
}
