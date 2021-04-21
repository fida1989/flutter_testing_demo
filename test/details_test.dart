import 'dart:convert';
import 'package:flutter_testing_demo/api/repository.dart';
import 'package:flutter_testing_demo/utils/constants.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('Details test', () {
    test("Testing single api data id", () async {
      //setup the test
      final apiProvider = Repository();
      // Set optional mock client
      apiProvider.client = MockClient((request) async {
        final mapJson = Constants.oneData;
        return Response(json.encode(mapJson), 200);
      });
      final item = await apiProvider.fetchPost();
      expect(item.id, 1);
    });
    test("Testing all api data count", () async {
      //setup the test
      final apiProvider = Repository();
      // Set optional mock client
      apiProvider.client = MockClient((request) async {
        final mapJson = Constants.allData;
        return Response(json.encode(mapJson), 200);
      });
      List item = await apiProvider.fetchAllPosts();
      expect(item.length, 16);
    });
  });
}
