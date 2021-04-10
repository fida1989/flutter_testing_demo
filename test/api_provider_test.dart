import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:flutter_testing_demo/api_provider.dart';


void main(){
  test("Testing the network call", () async{
    //setup the test
    final apiProvider = ApiProvider();
    // Set optional mock client
    apiProvider.client = MockClient((request) async {
      final mapJson = {'id':1};
      return Response(json.encode(mapJson),200);
    });
    final item = await apiProvider.fetchPosts();
    expect(item.id, 1);
  });
}