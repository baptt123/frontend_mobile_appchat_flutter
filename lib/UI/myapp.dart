import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StompClient? stompClient;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://192.168.1.104:8080/ws', // Địa chỉ IP của máy tính chạy server
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

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      stompClient?.send(
        destination: '/app/chat',
        body: _controller.text,
      );
    }
  }

  @override
  void dispose() {
    stompClient?.deactivate();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            SizedBox(height: 24),
            // Hiển thị tin nhắn từ server
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }
}
