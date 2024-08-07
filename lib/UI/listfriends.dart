import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class ListFriendsUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class ListFriendsUIState extends State<ListFriendsUI> {
  List<User>? userList;
  int? itemChat;

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: TextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Tìm kiếm',
                    iconColor: Colors.cyan,
                    fillColor: Colors.tealAccent),
                maxLength: 50,
                textAlign: TextAlign.left)),
        buildListFriendOnlineByHorizontal(),
        buildListChatByVertical()
      ],
    ));
  }

  Widget buildListFriendOnlineByHorizontal() => new Expanded(
      flex: 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList!.length,
        padding: EdgeInsets.all(0.8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 20,
              width: 20,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)));
        },
      ));

  Widget buildListChatByVertical() => new Expanded(
      flex: 2,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text('Đây là tin nhắn cho bạn'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text('Đây là tin nhắn cho bạn'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text('Đây là tin nhắn cho bạn'),
            ),
          )
        ],
      ));
}
