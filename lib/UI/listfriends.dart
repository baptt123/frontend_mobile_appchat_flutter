import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

void main() {
  runApp(ListFriendsUI());
}

class ListFriendsUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState()
      // TODO: implement createState
      =>
      ListFriendsUIState();
}

class ListFriendsUIState extends State<ListFriendsUI> {
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text('Danh sách bạn bè',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      )),
              backgroundColor: Colors.lightBlueAccent),
          body: Container(child: buildListFriend()),
        ),
      ),
    );
  }

  Widget buildListFriend() {
    return new ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Tên bạn bè:${index}'),
            subtitle: Text('Bạn bè:${index}'),
            leading: Icon(
              Icons.account_circle_rounded,
              size: 20,
            ),
          );
        },
        itemCount: 10);
  }
}
