class ItemModel{
  int userId;
  int id;
  String title;
  String body;

  ItemModel.fromJson(Map<String,dynamic> parsedJson){
    userId = parsedJson['userId'];
    id = parsedJson['id'];
    title = parsedJson['title'];
    body = parsedJson['body'];
  }

}