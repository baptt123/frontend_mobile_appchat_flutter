import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoadProfileUI());
}

class LoadProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProfileUI();
  }
}

class ProfileUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileUIState();
}

class ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Trang cá nhân'), centerTitle: true),
        body: Column(
          children: <Widget>[buildAvatar(), buildListPost()],
        ),
      ),
    ));
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

Widget buildAvatar() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    ),
    margin: EdgeInsets.all(10),
    width: 100,
    height: 100,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50), // Bo tròn các góc của ảnh
      child: Image.asset(
        'assets/img/flutter_img.png',
        fit: BoxFit.cover, // Đảm bảo ảnh vừa với khung chứa
      ),
    ),
  );

}