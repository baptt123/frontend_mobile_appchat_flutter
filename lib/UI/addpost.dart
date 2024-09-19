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
          // bottomNavigationBar: ConvexAppBar(
          //   items: [
          //     TabItem(icon: Icons.camera_alt, title: "Máy ảnh"),
          //     TabItem(icon: Icons.add_a_photo, title: "Thêm ảnh có sẵn"),
          //     TabItem(icon: Icons.video_call_rounded, title: "Video"),
          //     TabItem(
          //         icon: Icons.videocam_off_sharp, title: "Thêm video có sẵn")
          //   ],
          // )
          persistentFooterButtons: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo)),
            IconButton(onPressed: (){},icon:Icon(Icons.location_on)),
            IconButton(onPressed: (){}, icon: Icon(Icons.video_call_outlined))
          ],
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text("Thêm bài viết"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_sharp),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Bạn đang nghĩ gì'),
                ),
                if (listImage != null && listImage.isNotEmpty)
                  Column(
                    children: [
                      for (var i in listImage) Image.network(i.toString()),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
