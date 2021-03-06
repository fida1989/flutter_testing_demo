import 'package:flutter/material.dart';
import 'package:flutter_testing_demo/api/repository.dart';
import 'package:flutter_testing_demo/pages/details.dart';
import 'package:flutter_testing_demo/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller;
  String _reversed;
  String year;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    year = Utils.getYear();
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
            Row(
              children: [
                Text(
                  "Hello Test",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Spacer(),
                Text(
                  year ?? "Year",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            TextField(
              key: Key("myKey"),
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Enter a string"),
            ),
            const SizedBox(height: 10.0),
            if (_reversed != null) ...[
              Text(
                _reversed,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
            RaisedButton(
              child: Text("Reverse"),
              onPressed: () {
                if (_controller.text.isEmpty) return;
                setState(() {
                  _reversed = Utils.reverseString(_controller.text);
                });
              },
            ),
            RaisedButton(
              child: Text("Details"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage(apiProvider: Repository())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
