import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testing_demo/api/repository.dart';

import '../models/item_model.dart';

class DetailsPage extends StatefulWidget {
  final Repository apiProvider;

  const DetailsPage({Key key, this.apiProvider}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(this.apiProvider);
}

class _DetailsPageState extends State<DetailsPage> {
  ItemModel itemModel;
  List<ItemModel> items = [];
  String title;
  final Repository apiProvider;

  _DetailsPageState(this.apiProvider);

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      List<ItemModel> data = await apiProvider.fetchAllPosts();
      itemModel = await apiProvider.fetchPost();
      setState(() {
        title = itemModel.id.toString();
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title != null ? title : "Loading...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(items[index].id.toString()),
                      SizedBox(
                        width: 2.5,
                      ),
                      Expanded(
                          child: Text(
                       items[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
