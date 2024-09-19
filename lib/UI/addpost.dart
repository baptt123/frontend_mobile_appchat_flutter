import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(AddPost());

class AddPost extends StatelessWidget {
  List<Uri> listImage = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.camera_alt, title: "Máy ảnh"),
              TabItem(icon: Icons.add_a_photo, title: "Thêm ảnh có sẵn"),
              TabItem(icon: Icons.video_call_rounded, title: "Video"),
              TabItem(
                  icon: Icons.videocam_off_sharp, title: "Thêm video có sẵn")
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text("Thêm bài viết"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_sharp),
            ),
          ),
          body: Column(
            children: [
              Container(
                child: Text('Bạn đang nghĩ gì'),
              ),
              Expanded(child: Column(
                children: (listImage == null || listImage.isEmpty)
                    ? []
                    : [for (var i in listImage) Image.network(i as String)],
              ))

            ],
          ),
        ),
      ),
    );
  }
}
