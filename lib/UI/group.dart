import 'package:flutter/material.dart';

class GroupUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GroupUIState();
  }
}

class GroupUIState extends State<GroupUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Hình ảnh có chiều cao cố định
              Container(
                width: 200,
                height: 200,
                child: Image.asset('assets/img/flutter_img.png'),
              ),
              // Nút "Rời nhóm"
              Container(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Rời nhóm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                  ),
                ),
              ),
              // Danh sách bài viết
              Expanded(
                child: buildListPost(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Danh sách các bài đăng
Widget buildListPost() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Column(
        children: <Widget>[
          buildProfile(),
          buildContent(),
          buildActionCommentAndReact(),
          Divider(), // Thêm dấu phân cách giữa các bài viết
        ],
      );
    },
    itemCount: 10,
  );
}

// Thông tin người dùng
Widget buildProfile() {
  return ListTile(
    leading: Icon(Icons.account_circle_rounded, size: 40),
    title: Text('Tên tài khoản'),
    subtitle: Text('Thời gian đăng'),
  );
}

// Nội dung bài viết
Widget buildContent() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('Nội dung bài viết'),
  );
}

// Nút thích và bình luận
Widget buildActionCommentAndReact() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
      IconButton(onPressed: () {}, icon: Icon(Icons.comment_rounded)),
    ],
  );
}

void main() {
  runApp(GroupUI());
}
