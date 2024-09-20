import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_flutter/model/messageapp.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(ChatWithFriendUI());
}

class ChatWithFriendUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatWithFriendState();
}

class ChatWithFriendState extends State<ChatWithFriendUI> {
  StompClient? stompClient;
  int? listSize; // giả sử biến này là số lượng tin nhắn

  TextEditingController editingController = TextEditingController();

  get text => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://192.168.67.105:8080/ws',
        // Địa chỉ IP của máy tính chạy server
        onConnect: onConnect,
        onWebSocketError: (dynamic error) => print(error.toString()),
      ),
    );
    stompClient?.activate();
  }

  void onConnect(StompFrame frame) {
    stompClient?.subscribe(
      destination: '/topic/message',
      callback: (frame) {
        if (frame.body != null) {
          print(frame.body);
        }
      },
    );
  }

  void sendMessage() {
    if (editingController.text.isNotEmpty && stompClient?.connected == true) {
      MessageApp message = MessageApp(id: 1, content: editingController.text);
      stompClient?.send(
        destination: '/app/chat',
        body: jsonEncode(message.toJson()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Không thể gửi tin nhắn, kết nối chưa được thiết lập",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.pinkAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  @override
  void dispose() {
    stompClient?.deactivate(); // Hủy kết nối STOMP khi widget bị hủy
    editingController.dispose(); // Đừng quên dispose TextEditingController
    super.dispose();
  }


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
                margin: EdgeInsets.only(right: 100),
                padding: EdgeInsets.only(right: 100),
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
                  margin: EdgeInsets.only(left: 100),
                  padding: EdgeInsets.only(left: 100),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Tin nhắn ${index}'),
                ));
          }
          ;
        });
  }

  Widget buildPressMessage() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200], // Thay đổi màu nền nếu cần
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: editingController,
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
              sendMessage();
              // Fluttertoast.showToast(
              //     msg: "Đây là một toast!",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.BOTTOM,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.black,
              //     textColor: Colors.white,
              //     fontSize: 16.0);
              print('Thêm tin nhắn thành công');
            },
            child: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
