import 'package:flutter/material.dart';

void main() {
  runApp(RunListCommentUI());
}

class RunListCommentUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ListCommentUI(),
    );
  }
}

class ListCommentUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('User 1'),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('User 2'),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('User 3'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Show Bottom Sheet'),
          ),
        ),
      ),
    );
  }
}
