import 'package:flutter/material.dart';

class GroupUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GroupUIState();
  }
}

class GroupUIState extends State<GroupUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(children: [
            Expanded(
                flex: 2,
                child: Container(
                  child: Image.asset('assets/img/flutter_img.png'),
                  width: 200,
                  height: 200,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Rời nhóm'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent),
                  ),
                )),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(child: buildListPost()),
            )
          ]),
        ),
      ),
    );
  }
}

Widget buildListPost() {
  return new Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                buildProfile(),
                buildContent(),
                buildActionCommentAndReact()
              ],
            );
          },
          itemCount: 10));
}

Widget buildProfile() {
  return ListTile(
    leading: Icon(Icons.account_circle_rounded),
    title: Text('Tên tài khoản'),
    subtitle: Text('Thời gian đăng'),
  );
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
