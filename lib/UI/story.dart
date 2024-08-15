import 'package:flutter/material.dart';

//UI này dùng để hiển thị listview story
class StoryUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StoryUIState();
  }
}

class StoryUIState extends State<StoryUI> {
  List<String>? listStories;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildListView(10);
  }

  Widget buildListView(int count) {
    return Expanded(child: ListView.builder(scrollDirection:Axis.horizontal,itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.only(left: 10),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/img/flutter_img.png')
        ),
      );
    },itemCount: 10,));
  }
}
