import 'package:flutter/material.dart';

void main() {
  runApp(ChatWithFriendUI());
}

class ChatWithFriendUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatWithFriendState();
}

class ChatWithFriendState extends State<ChatWithFriendUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Tên bạn bè'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_call),
                onPressed: () {},
              ),
              IconButton(icon: Icon(Icons.camera_alt), onPressed: () {})
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(flex: 2, child: buildListViewMessage()),
              buildPressMessage()
            ],
          )),
    ));
  }

  Widget buildListViewMessage() {
    return new ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          //nếu là index lẻ thì là tin nhắn của chính bạn
          if (index % 2 != 0) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Container(
                margin: EdgeInsets.only(right:100),
                  padding:EdgeInsets.only(right: 100),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Text('Tin nhắn ${index}'),
              ),
            );
          } else if (index % 2 == 0) {
            return ListTile(
                trailing: Icon(Icons.account_circle_outlined),
                title: Container(
                  margin: EdgeInsets.only(left:100),
                  padding:EdgeInsets.only(left:100),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Tin nhắn ${index}'),
                ));
          }
          ;
        });
  }
}

Widget buildPressMessage() {
  return Container(
    padding: EdgeInsets.all(8.0),
    color: Colors.grey[200], // Thay đổi màu nền nếu cần
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Nhập tin nhắn',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            // Xử lý khi nhấn nút
            print('Send button pressed');
          },
          child: Icon(Icons.send),
        ),
      ],
    ),
  );
}

