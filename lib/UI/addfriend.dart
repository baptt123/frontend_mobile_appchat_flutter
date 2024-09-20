import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddFriendUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddFriendUIState();
  }
}

class AddFriendUIState extends State<AddFriendUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: buildListFriend(),
    ));
  }
}

class RunAddFriendUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddFriendUI(),
    );
  }
}

Widget buildListFriend() {
  return new ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Tên bạn bè:${index}'),
          subtitle: Text('Bạn bè:${index}'),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: (){}, child: Text('Thêm bạn bè')),
              TextButton(onPressed: (){}, child: Text('Xóa lời mời'))
            ],

          ),
          leading: Icon(
            Icons.account_circle_rounded,
            size: 20,
          )

        );
      },
      itemCount: 10);
}
void main(){
  runApp(RunAddFriendUI());
}
