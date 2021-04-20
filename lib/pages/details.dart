import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testing_demo/api/api_provider.dart';

import '../models/item_model.dart';

class DetailsPage extends StatefulWidget {

  final ApiProvider apiProvider;

  const DetailsPage({Key key, this.apiProvider}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(this.apiProvider);


}

class _DetailsPageState extends State<DetailsPage> {
  ItemModel itemModel;
  String title;
  final ApiProvider apiProvider;

  _DetailsPageState(this.apiProvider);

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      itemModel = await apiProvider.fetchPosts();
      setState(() {
       title = itemModel.id.toString();
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
          ],
        ),
      ),
    );
  }
}
