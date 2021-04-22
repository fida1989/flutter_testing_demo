import 'package:flutter_testing_demo/utils/urls.dart';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import 'dart:convert';

class Repository {
  Client client = Client();
  Future<ItemModel> fetchPost() async {
    final response = await client.get(Uri.parse(Urls.single));
    ItemModel itemModel = ItemModel.fromJson(json.decode(response.body));
    return itemModel;
  }

  Future<List<ItemModel>> fetchAllPosts() async {
    final response = await client.get(Uri.parse(Urls.all));
    List<ItemModel> items = [];
    List data = jsonDecode(response.body);
    for(var item in data){
      ItemModel itemModel = ItemModel.fromJson(item);
      items.add(itemModel);
    }
    return items;
  }
}