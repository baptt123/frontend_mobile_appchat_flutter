import 'package:flutter/material.dart';

class PostListUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class PostListState extends State<PostListUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: Text('App Chat'),
            ),
            body: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            )));
  }
}
