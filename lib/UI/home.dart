import 'package:flutter/material.dart';

void main() {
  runApp(HomeUI());
}

class HomeUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeUIState();
}

class HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Khám phá')),
        body: Column(
          children: <Widget>[buildListPost()],
        ),
      ),
    ));
  }

  Widget buildListPost() {
    return new Expanded(child: ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: <Widget>[
          buildProfile(),
          buildContent(),
          buildActionCommentAndReact()
        ],
      );
    },itemCount: 10));
  }

  Widget buildProfile() {
    return ListTile(
      leading: Icon(Icons.account_circle_rounded),
      title: Text('Tên tài khoản'),
      subtitle: Text('Thời gian đăng'),
    );
  }
}
//hàm này tạo 1 row gồm ảnh và tên tài khoản người dùng

Widget buildContent() {
  return Container(child: Text('Nội dung bài viết'));
}

Widget buildActionCommentAndReact() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
      IconButton(onPressed: () {}, icon: Icon(Icons.comment_rounded))

    ],
  );
}
